package fpt.fall23.onlearn.service.impl;

import java.util.List;
import java.util.Optional;

import fpt.fall23.onlearn.dto.ResponseDTO;
import fpt.fall23.onlearn.entity.*;
import fpt.fall23.onlearn.service.AuthenticationService;
import fpt.fall23.onlearn.service.StudentService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import fpt.fall23.onlearn.repository.FeedContentRepository;
import fpt.fall23.onlearn.repository.FeedbackDetailRepository;
import fpt.fall23.onlearn.repository.FeedbackRepository;
import fpt.fall23.onlearn.service.FeedbackService;

@Service
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    FeedbackRepository feedbackRepository;

    @Autowired
    FeedbackDetailRepository feedbackDetailRepository;

    @Autowired
    FeedContentRepository feedContentRepository;

    @Override
    public List<Feedback> findAllByCourseId(Long courseId) {
        return feedbackRepository.getFeedbackByEnrollCourseId(courseId);
    }

    @Override
    public List<Feedback> getAllFeedbacks() {
        return feedbackRepository.findAll();
    }

    @Override
    public Feedback getFeedbackById(Long id) {
        // TODO Auto-generated method stub
        Optional<Feedback> feedback = feedbackRepository.findById(id);
        if (feedback.isPresent()) {
            return feedback.get();
        }
        return null;
    }

    @Override
    public Feedback saveFeedback(Feedback feedback) {
        return feedbackRepository.save(feedback);
    }

    @Override
    public Boolean removeFeedback(Long id) {
        Optional<Feedback> feedback = feedbackRepository.findById(id);
        if (feedback.isPresent()) {
            feedbackRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public FeedContent saveFeedContent(FeedContent feedContent) {
        return feedContentRepository.save(feedContent);
    }

    @Override
    public List<FeedContent> getAllFeedContents() {
        return feedContentRepository.findAll();
    }

    @Override
    public FeedContent getFeedContentById(Long feedContentId) {
        Optional<FeedContent> feedContent = feedContentRepository.findById(feedContentId);
        if (feedContent.isPresent()) {
            return feedContent.get();
        }
        return null;
    }

    @Override
    public FeedbackDetail saveFeedbackDetail(FeedbackDetail feedbackDetail) {
        return feedbackDetailRepository.save(feedbackDetail);
    }


    @PersistenceContext
    EntityManager entityManager;

    @Override
    public ResponseDTO<Long> getRatingByTeacherId(Long teacherId) {
        String nativeQuery = "select sum(fd.rate) / (select count(*) from feedback_detail where type ='radio') as total \n" +
                "from feedback_detail fd \n" +
                "left join feedback fb on fd.feedback_id = fb.id\n" +
                "left join enroll e  ON e.id = fb.enroll_id\n" +
                "left join course c ON c.id = e.course_id\n" +
                "where type ='radio' and c.teacher_id = ?;";

        Long result = (Long) entityManager.createNativeQuery(nativeQuery)
                .setParameter(1, teacherId).getSingleResult();
        return new ResponseDTO<>(HttpStatus.OK.value(), "success", result);
    }

    @Override
    public Feedback getFeedbackByEnrollId(Long enrollId) {
        return feedbackRepository.getFeedbackByEnrollId(enrollId);
    }


    @Override
    public List<Feedback> findAllByStudentId(Long studentId) {
        return feedbackRepository.getFeedbackByEnrollStudentId(studentId);
    }

    @Autowired
    AuthenticationService authenticationService;
    @Autowired
    StudentService studentService;

    @Override
    public List<Feedback> findAllByCourseStudent(Long courseId) {
        Optional<Account> account = authenticationService.getCurrentAuthenticatedAccount();
        if (account.isPresent()) {
            Student student = studentService.findStudentByAccountId(account.get().getId());
            List<Feedback> feedbacks = feedbackRepository.getFeedbackByEnrollCourseStudent(student.getId(), courseId);
            return feedbacks;
        }
        return null;
    }
}
