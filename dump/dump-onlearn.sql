PGDMP         *                {            onlearn    15.4    15.4 "   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16389    onlearn    DATABASE     s   CREATE DATABASE onlearn WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE onlearn;
                onlearn    false            �            1259    30580    account    TABLE     �  CREATE TABLE public.account (
    id bigint NOT NULL,
    created_at timestamp(6) with time zone,
    deleted_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    active boolean,
    password character varying(255),
    role smallint,
    username character varying(255),
    profile_id bigint,
    CONSTRAINT account_role_check CHECK (((role >= 0) AND (role <= 3)))
);
    DROP TABLE public.account;
       public         heap    onlearn    false            �            1259    30579    account_id_seq    SEQUENCE     w   CREATE SEQUENCE public.account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.account_id_seq;
       public          onlearn    false    215            �           0    0    account_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;
          public          onlearn    false    214            �            1259    30590    answer    TABLE     �   CREATE TABLE public.answer (
    id bigint NOT NULL,
    content character varying(255),
    is_correct boolean,
    question_id bigint
);
    DROP TABLE public.answer;
       public         heap    onlearn    false            �            1259    30589    answer_id_seq    SEQUENCE     v   CREATE SEQUENCE public.answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.answer_id_seq;
       public          onlearn    false    217            �           0    0    answer_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.answer_id_seq OWNED BY public.answer.id;
          public          onlearn    false    216            �            1259    30597    course    TABLE     i  CREATE TABLE public.course (
    id bigint NOT NULL,
    average_point double precision,
    create_date timestamp(6) without time zone,
    description text,
    image character varying(255),
    limit_time integer,
    name character varying(255),
    price double precision,
    status character varying(255),
    subject_id bigint,
    teacher_id bigint
);
    DROP TABLE public.course;
       public         heap    onlearn    false            �            1259    30596    course_id_seq    SEQUENCE     v   CREATE SEQUENCE public.course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.course_id_seq;
       public          onlearn    false    219            �           0    0    course_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;
          public          onlearn    false    218            �            1259    30605    device    TABLE     a   CREATE TABLE public.device (
    token character varying(255) NOT NULL,
    account_id bigint
);
    DROP TABLE public.device;
       public         heap    onlearn    false            �            1259    30611    enroll    TABLE     �  CREATE TABLE public.enroll (
    id bigint NOT NULL,
    amount double precision,
    finish_date timestamp(6) without time zone,
    payment_status character varying(255),
    request_date timestamp(6) without time zone,
    status character varying(255),
    course_id bigint,
    student_id bigint,
    syllabus_id bigint,
    commission double precision,
    commission_amount double precision,
    is_banned boolean
);
    DROP TABLE public.enroll;
       public         heap    onlearn    false            �            1259    30610    enroll_id_seq    SEQUENCE     v   CREATE SEQUENCE public.enroll_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.enroll_id_seq;
       public          onlearn    false    222            �           0    0    enroll_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.enroll_id_seq OWNED BY public.enroll.id;
          public          onlearn    false    221            �            1259    30621    feed_content    TABLE     �   CREATE TABLE public.feed_content (
    id bigint NOT NULL,
    content character varying(255),
    proportion double precision
);
     DROP TABLE public.feed_content;
       public         heap    onlearn    false            �            1259    30620    feed_content_id_seq    SEQUENCE     |   CREATE SEQUENCE public.feed_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.feed_content_id_seq;
       public          onlearn    false    224            �           0    0    feed_content_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.feed_content_id_seq OWNED BY public.feed_content.id;
          public          onlearn    false    223            �            1259    30628    feedback    TABLE     �   CREATE TABLE public.feedback (
    id bigint NOT NULL,
    content text,
    create_date date,
    status boolean,
    enroll_id bigint
);
    DROP TABLE public.feedback;
       public         heap    onlearn    false            �            1259    30635    feedback_detail    TABLE     �   CREATE TABLE public.feedback_detail (
    id bigint NOT NULL,
    rate integer NOT NULL,
    text text,
    type character varying(255),
    feed_content_id bigint,
    feedback_id bigint
);
 #   DROP TABLE public.feedback_detail;
       public         heap    onlearn    false            �            1259    30634    feedback_detail_id_seq    SEQUENCE        CREATE SEQUENCE public.feedback_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.feedback_detail_id_seq;
       public          onlearn    false    228            �           0    0    feedback_detail_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.feedback_detail_id_seq OWNED BY public.feedback_detail.id;
          public          onlearn    false    227            �            1259    30627    feedback_id_seq    SEQUENCE     x   CREATE SEQUENCE public.feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.feedback_id_seq;
       public          onlearn    false    226            �           0    0    feedback_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.feedback_id_seq OWNED BY public.feedback.id;
          public          onlearn    false    225            �            1259    30644    lesson    TABLE     �  CREATE TABLE public.lesson (
    id bigint NOT NULL,
    content text,
    date_time date,
    description text,
    estimate_time integer,
    name character varying(255),
    status character varying(255),
    type character varying(255),
    url character varying(255),
    course_id bigint,
    CONSTRAINT lesson_type_check CHECK (((type)::text = ANY ((ARRAY['VIDEO'::character varying, 'READING'::character varying])::text[])))
);
    DROP TABLE public.lesson;
       public         heap    onlearn    false            �            1259    30643    lesson_id_seq    SEQUENCE     v   CREATE SEQUENCE public.lesson_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.lesson_id_seq;
       public          onlearn    false    230            �           0    0    lesson_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.lesson_id_seq OWNED BY public.lesson.id;
          public          onlearn    false    229            �            1259    30654    notification    TABLE     �   CREATE TABLE public.notification (
    id bigint NOT NULL,
    message character varying(255),
    read boolean,
    status boolean,
    title character varying(255),
    trash boolean,
    account_id bigint,
    student_id bigint
);
     DROP TABLE public.notification;
       public         heap    onlearn    false            �            1259    30653    notification_id_seq    SEQUENCE     |   CREATE SEQUENCE public.notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.notification_id_seq;
       public          onlearn    false    232            �           0    0    notification_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;
          public          onlearn    false    231            �            1259    30663    payment_history    TABLE     {  CREATE TABLE public.payment_history (
    id bigint NOT NULL,
    amount double precision,
    bank_information character varying(255),
    capture_id character varying(255),
    card_details character varying(255),
    order_id character varying(255),
    payment_history_status character varying(255),
    payment_method character varying(255),
    payout_batch_id character varying(255),
    payout_batch_item_id character varying(255),
    transaction_date timestamp(6) without time zone,
    account_id bigint,
    student_id bigint,
    teacher_id bigint,
    wallet_id bigint,
    payment_history_type character varying(255)
);
 #   DROP TABLE public.payment_history;
       public         heap    onlearn    false            �            1259    30662    payment_history_id_seq    SEQUENCE        CREATE SEQUENCE public.payment_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_history_id_seq;
       public          onlearn    false    234            �           0    0    payment_history_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_history_id_seq OWNED BY public.payment_history.id;
          public          onlearn    false    233            �            1259    30673    payment_methods    TABLE     �   CREATE TABLE public.payment_methods (
    id bigint NOT NULL,
    card_expiration_date date,
    card_holder_name character varying(255),
    card_number character varying(255),
    method_type character varying(255),
    account_id bigint
);
 #   DROP TABLE public.payment_methods;
       public         heap    onlearn    false            �            1259    30672    payment_methods_id_seq    SEQUENCE        CREATE SEQUENCE public.payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_methods_id_seq;
       public          onlearn    false    236            �           0    0    payment_methods_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_methods_id_seq OWNED BY public.payment_methods.id;
          public          onlearn    false    235            �            1259    30682    profile    TABLE     R  CREATE TABLE public.profile (
    id bigint NOT NULL,
    address character varying(255),
    avatar character varying(255),
    date_of_birth date,
    description text,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    phone character varying(255),
    status boolean
);
    DROP TABLE public.profile;
       public         heap    onlearn    false            �            1259    30681    profile_id_seq    SEQUENCE     w   CREATE SEQUENCE public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.profile_id_seq;
       public          onlearn    false    238            �           0    0    profile_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.profile_id_seq OWNED BY public.profile.id;
          public          onlearn    false    237            �            1259    30691    question    TABLE     �   CREATE TABLE public.question (
    id bigint NOT NULL,
    content character varying(255),
    course_id bigint,
    lesson_id bigint,
    teacher_id bigint
);
    DROP TABLE public.question;
       public         heap    onlearn    false            �            1259    30690    question_id_seq    SEQUENCE     x   CREATE SEQUENCE public.question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.question_id_seq;
       public          onlearn    false    240            �           0    0    question_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;
          public          onlearn    false    239            �            1259    30698    quiz    TABLE     :  CREATE TABLE public.quiz (
    id bigint NOT NULL,
    allow_attempt integer,
    date_range integer,
    duration double precision,
    pass_score double precision,
    proportion double precision,
    status character varying(255),
    title character varying(255),
    lesson_id bigint,
    date_create date
);
    DROP TABLE public.quiz;
       public         heap    onlearn    false            �            1259    30697    quiz_id_seq    SEQUENCE     t   CREATE SEQUENCE public.quiz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.quiz_id_seq;
       public          onlearn    false    242            �           0    0    quiz_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.quiz_id_seq OWNED BY public.quiz.id;
          public          onlearn    false    241                       1259    31110    reject    TABLE     �   CREATE TABLE public.reject (
    id bigint NOT NULL,
    reason character varying(255),
    reject_count integer,
    course_id bigint
);
    DROP TABLE public.reject;
       public         heap    onlearn    false                       1259    31130    reject_course    TABLE     {   CREATE TABLE public.reject_course (
    id bigint NOT NULL,
    date_reject date,
    reason text,
    course_id bigint
);
 !   DROP TABLE public.reject_course;
       public         heap    onlearn    false                       1259    31129    reject_course_id_seq    SEQUENCE     }   CREATE SEQUENCE public.reject_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.reject_course_id_seq;
       public          onlearn    false    278            �           0    0    reject_course_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.reject_course_id_seq OWNED BY public.reject_course.id;
          public          onlearn    false    277                       1259    31109    reject_id_seq    SEQUENCE     v   CREATE SEQUENCE public.reject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.reject_id_seq;
       public          onlearn    false    276            �           0    0    reject_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.reject_id_seq OWNED BY public.reject.id;
          public          onlearn    false    275            �            1259    30707    report    TABLE     d  CREATE TABLE public.report (
    id bigint NOT NULL,
    content text,
    create_time date,
    status boolean,
    student_id bigint,
    teacher_id bigint,
    report_type character varying(255),
    CONSTRAINT report_report_type_check CHECK (((report_type)::text = ANY ((ARRAY['STUDENT'::character varying, 'TEACHER'::character varying])::text[])))
);
    DROP TABLE public.report;
       public         heap    onlearn    false            �            1259    30706    report_id_seq    SEQUENCE     v   CREATE SEQUENCE public.report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.report_id_seq;
       public          onlearn    false    244            �           0    0    report_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.report_id_seq OWNED BY public.report.id;
          public          onlearn    false    243            �            1259    30714    resource    TABLE     �   CREATE TABLE public.resource (
    id bigint NOT NULL,
    content text,
    resource_type character varying(255),
    lesson_id bigint,
    name character varying(255)
);
    DROP TABLE public.resource;
       public         heap    onlearn    false            �            1259    30713    resource_id_seq    SEQUENCE     x   CREATE SEQUENCE public.resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.resource_id_seq;
       public          onlearn    false    246            �           0    0    resource_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.resource_id_seq OWNED BY public.resource.id;
          public          onlearn    false    245            �            1259    30723    result_detail    TABLE     �   CREATE TABLE public.result_detail (
    id bigint NOT NULL,
    is_correct boolean,
    result_quiz_id bigint,
    used_answer_id bigint,
    used_question_id bigint
);
 !   DROP TABLE public.result_detail;
       public         heap    onlearn    false            �            1259    30722    result_detail_id_seq    SEQUENCE     }   CREATE SEQUENCE public.result_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.result_detail_id_seq;
       public          onlearn    false    248            �           0    0    result_detail_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.result_detail_id_seq OWNED BY public.result_detail.id;
          public          onlearn    false    247            �            1259    30730    result_quiz    TABLE     W  CREATE TABLE public.result_quiz (
    id bigint NOT NULL,
    last_point double precision,
    result_status character varying(255),
    start_time timestamp(6) without time zone,
    submit_time timestamp(6) without time zone,
    enroll_id bigint,
    quiz_id bigint,
    student_id bigint,
    process_time integer,
    is_count boolean
);
    DROP TABLE public.result_quiz;
       public         heap    onlearn    false            �            1259    30729    result_quiz_id_seq    SEQUENCE     {   CREATE SEQUENCE public.result_quiz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.result_quiz_id_seq;
       public          onlearn    false    250            �           0    0    result_quiz_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.result_quiz_id_seq OWNED BY public.result_quiz.id;
          public          onlearn    false    249            �            1259    30737    staff    TABLE     �   CREATE TABLE public.staff (
    id bigint NOT NULL,
    bank_name character varying(255),
    card_holder_name character varying(255),
    card_number character varying(255),
    staff_number character varying(255),
    account_id bigint
);
    DROP TABLE public.staff;
       public         heap    onlearn    false            �            1259    30736    staff_id_seq    SEQUENCE     u   CREATE SEQUENCE public.staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.staff_id_seq;
       public          onlearn    false    252            �           0    0    staff_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;
          public          onlearn    false    251            �            1259    30746    student    TABLE     z   CREATE TABLE public.student (
    id bigint NOT NULL,
    student_number character varying(255),
    account_id bigint
);
    DROP TABLE public.student;
       public         heap    onlearn    false            �            1259    30745    student_id_seq    SEQUENCE     w   CREATE SEQUENCE public.student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.student_id_seq;
       public          onlearn    false    254            �           0    0    student_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;
          public          onlearn    false    253                        1259    30753    subject    TABLE     �   CREATE TABLE public.subject (
    id bigint NOT NULL,
    create_date date,
    description character varying(255),
    min_price double precision NOT NULL,
    name character varying(255),
    status boolean,
    staff_id bigint
);
    DROP TABLE public.subject;
       public         heap    onlearn    false            �            1259    30752    subject_id_seq    SEQUENCE     w   CREATE SEQUENCE public.subject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.subject_id_seq;
       public          onlearn    false    256            �           0    0    subject_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.subject_id_seq OWNED BY public.subject.id;
          public          onlearn    false    255                       1259    30762    syllabus    TABLE     �   CREATE TABLE public.syllabus (
    id bigint NOT NULL,
    create_date date,
    name character varying(255),
    status character varying(255),
    course_id bigint
);
    DROP TABLE public.syllabus;
       public         heap    onlearn    false                       1259    30761    syllabus_id_seq    SEQUENCE     x   CREATE SEQUENCE public.syllabus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.syllabus_id_seq;
       public          onlearn    false    258            �           0    0    syllabus_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.syllabus_id_seq OWNED BY public.syllabus.id;
          public          onlearn    false    257                       1259    30770    syllabus_lessons    TABLE     j   CREATE TABLE public.syllabus_lessons (
    syllabus_id bigint NOT NULL,
    lessons_id bigint NOT NULL
);
 $   DROP TABLE public.syllabus_lessons;
       public         heap    onlearn    false                       1259    30776    system_config    TABLE     �  CREATE TABLE public.system_config (
    id bigint NOT NULL,
    date_create date,
    default_image character varying(255),
    default_quiz_time integer,
    project_name character varying(255),
    retry_test_time integer,
    studying_time integer,
    version character varying(255),
    commission_fee double precision,
    description character varying(255),
    teacher_commission_fee double precision,
    waiting_quiz_time integer,
    refunded_time integer
);
 !   DROP TABLE public.system_config;
       public         heap    onlearn    false                       1259    30775    system_config_id_seq    SEQUENCE     }   CREATE SEQUENCE public.system_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.system_config_id_seq;
       public          onlearn    false    261            �           0    0    system_config_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.system_config_id_seq OWNED BY public.system_config.id;
          public          onlearn    false    260                       1259    30785    teacher    TABLE     �   CREATE TABLE public.teacher (
    id bigint NOT NULL,
    rating double precision,
    teacher_number character varying(255),
    account_id bigint
);
    DROP TABLE public.teacher;
       public         heap    onlearn    false                       1259    30784    teacher_id_seq    SEQUENCE     w   CREATE SEQUENCE public.teacher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.teacher_id_seq;
       public          onlearn    false    263            �           0    0    teacher_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.teacher_id_seq OWNED BY public.teacher.id;
          public          onlearn    false    262            	           1259    30792    transaction    TABLE     �  CREATE TABLE public.transaction (
    id bigint NOT NULL,
    account_name character varying(255),
    amount double precision,
    date_process timestamp(6) without time zone,
    description character varying(255),
    parent_id bigint,
    transaction_status character varying(255),
    transaction_type character varying(255),
    enroll_id bigint,
    student_id bigint,
    teacher_id bigint,
    wallet_id bigint,
    withdraw_request_id bigint,
    CONSTRAINT transaction_transaction_status_check CHECK (((transaction_status)::text = ANY ((ARRAY['REQUEST'::character varying, 'COMPLETED'::character varying, 'DONE'::character varying, 'CANCEL'::character varying])::text[])))
);
    DROP TABLE public.transaction;
       public         heap    onlearn    false                       1259    30791    transaction_id_seq    SEQUENCE     {   CREATE SEQUENCE public.transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.transaction_id_seq;
       public          onlearn    false    265            �           0    0    transaction_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;
          public          onlearn    false    264                       1259    30803    used_answer    TABLE     �   CREATE TABLE public.used_answer (
    id bigint NOT NULL,
    content character varying(255),
    is_correct boolean,
    used_question_id bigint
);
    DROP TABLE public.used_answer;
       public         heap    onlearn    false            
           1259    30802    used_answer_id_seq    SEQUENCE     {   CREATE SEQUENCE public.used_answer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.used_answer_id_seq;
       public          onlearn    false    267            �           0    0    used_answer_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.used_answer_id_seq OWNED BY public.used_answer.id;
          public          onlearn    false    266                       1259    30810    used_question    TABLE     �   CREATE TABLE public.used_question (
    id bigint NOT NULL,
    content character varying(255),
    quiz_id bigint,
    status boolean
);
 !   DROP TABLE public.used_question;
       public         heap    onlearn    false                       1259    30809    used_question_id_seq    SEQUENCE     }   CREATE SEQUENCE public.used_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.used_question_id_seq;
       public          onlearn    false    269            �           0    0    used_question_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.used_question_id_seq OWNED BY public.used_question.id;
          public          onlearn    false    268                       1259    30817    wallet    TABLE     �   CREATE TABLE public.wallet (
    id bigint NOT NULL,
    amount double precision,
    bank_name character varying(255),
    bank_number character varying(255),
    wallet_type character varying(255),
    account_id bigint
);
    DROP TABLE public.wallet;
       public         heap    onlearn    false                       1259    30816    wallet_id_seq    SEQUENCE     v   CREATE SEQUENCE public.wallet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.wallet_id_seq;
       public          onlearn    false    271            �           0    0    wallet_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.wallet_id_seq OWNED BY public.wallet.id;
          public          onlearn    false    270                       1259    30826    withdrawal_request    TABLE     !  CREATE TABLE public.withdrawal_request (
    id bigint NOT NULL,
    request_comments character varying(255),
    request_date timestamp(6) without time zone,
    request_status character varying(255),
    withdrawal_amount double precision,
    teacher_id bigint,
    withdrawal_request_status character varying(255),
    CONSTRAINT withdrawal_request_withdrawal_request_status_check CHECK (((withdrawal_request_status)::text = ANY ((ARRAY['PENDING'::character varying, 'SUCCESS'::character varying, 'REJECT'::character varying])::text[])))
);
 &   DROP TABLE public.withdrawal_request;
       public         heap    onlearn    false                       1259    30825    withdrawal_request_id_seq    SEQUENCE     �   CREATE SEQUENCE public.withdrawal_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.withdrawal_request_id_seq;
       public          onlearn    false    273            �           0    0    withdrawal_request_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.withdrawal_request_id_seq OWNED BY public.withdrawal_request.id;
          public          onlearn    false    272                       1259    30835    withdrawal_request_transactions    TABLE     �   CREATE TABLE public.withdrawal_request_transactions (
    withdrawal_request_id bigint NOT NULL,
    transactions_id bigint NOT NULL
);
 3   DROP TABLE public.withdrawal_request_transactions;
       public         heap    onlearn    false                       2604    30583 
   account id    DEFAULT     h   ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);
 9   ALTER TABLE public.account ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    214    215    215                       2604    30593 	   answer id    DEFAULT     f   ALTER TABLE ONLY public.answer ALTER COLUMN id SET DEFAULT nextval('public.answer_id_seq'::regclass);
 8   ALTER TABLE public.answer ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    217    216    217                       2604    30600 	   course id    DEFAULT     f   ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);
 8   ALTER TABLE public.course ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    219    218    219                       2604    30614 	   enroll id    DEFAULT     f   ALTER TABLE ONLY public.enroll ALTER COLUMN id SET DEFAULT nextval('public.enroll_id_seq'::regclass);
 8   ALTER TABLE public.enroll ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    221    222    222                       2604    30624    feed_content id    DEFAULT     r   ALTER TABLE ONLY public.feed_content ALTER COLUMN id SET DEFAULT nextval('public.feed_content_id_seq'::regclass);
 >   ALTER TABLE public.feed_content ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    224    223    224                       2604    30631    feedback id    DEFAULT     j   ALTER TABLE ONLY public.feedback ALTER COLUMN id SET DEFAULT nextval('public.feedback_id_seq'::regclass);
 :   ALTER TABLE public.feedback ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    225    226    226                       2604    30638    feedback_detail id    DEFAULT     x   ALTER TABLE ONLY public.feedback_detail ALTER COLUMN id SET DEFAULT nextval('public.feedback_detail_id_seq'::regclass);
 A   ALTER TABLE public.feedback_detail ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    227    228    228                       2604    30647 	   lesson id    DEFAULT     f   ALTER TABLE ONLY public.lesson ALTER COLUMN id SET DEFAULT nextval('public.lesson_id_seq'::regclass);
 8   ALTER TABLE public.lesson ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    229    230    230                       2604    30657    notification id    DEFAULT     r   ALTER TABLE ONLY public.notification ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);
 >   ALTER TABLE public.notification ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    231    232    232                       2604    30666    payment_history id    DEFAULT     x   ALTER TABLE ONLY public.payment_history ALTER COLUMN id SET DEFAULT nextval('public.payment_history_id_seq'::regclass);
 A   ALTER TABLE public.payment_history ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    234    233    234                       2604    30676    payment_methods id    DEFAULT     x   ALTER TABLE ONLY public.payment_methods ALTER COLUMN id SET DEFAULT nextval('public.payment_methods_id_seq'::regclass);
 A   ALTER TABLE public.payment_methods ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    235    236    236                       2604    30685 
   profile id    DEFAULT     h   ALTER TABLE ONLY public.profile ALTER COLUMN id SET DEFAULT nextval('public.profile_id_seq'::regclass);
 9   ALTER TABLE public.profile ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    238    237    238                       2604    30694    question id    DEFAULT     j   ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);
 :   ALTER TABLE public.question ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    240    239    240                       2604    30701    quiz id    DEFAULT     b   ALTER TABLE ONLY public.quiz ALTER COLUMN id SET DEFAULT nextval('public.quiz_id_seq'::regclass);
 6   ALTER TABLE public.quiz ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    242    241    242            )           2604    31113 	   reject id    DEFAULT     f   ALTER TABLE ONLY public.reject ALTER COLUMN id SET DEFAULT nextval('public.reject_id_seq'::regclass);
 8   ALTER TABLE public.reject ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    275    276    276            *           2604    31133    reject_course id    DEFAULT     t   ALTER TABLE ONLY public.reject_course ALTER COLUMN id SET DEFAULT nextval('public.reject_course_id_seq'::regclass);
 ?   ALTER TABLE public.reject_course ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    277    278    278                       2604    30710 	   report id    DEFAULT     f   ALTER TABLE ONLY public.report ALTER COLUMN id SET DEFAULT nextval('public.report_id_seq'::regclass);
 8   ALTER TABLE public.report ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    243    244    244                       2604    30717    resource id    DEFAULT     j   ALTER TABLE ONLY public.resource ALTER COLUMN id SET DEFAULT nextval('public.resource_id_seq'::regclass);
 :   ALTER TABLE public.resource ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    245    246    246                       2604    30726    result_detail id    DEFAULT     t   ALTER TABLE ONLY public.result_detail ALTER COLUMN id SET DEFAULT nextval('public.result_detail_id_seq'::regclass);
 ?   ALTER TABLE public.result_detail ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    248    247    248                       2604    30733    result_quiz id    DEFAULT     p   ALTER TABLE ONLY public.result_quiz ALTER COLUMN id SET DEFAULT nextval('public.result_quiz_id_seq'::regclass);
 =   ALTER TABLE public.result_quiz ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    249    250    250                       2604    30740    staff id    DEFAULT     d   ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);
 7   ALTER TABLE public.staff ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    252    251    252                       2604    30749 
   student id    DEFAULT     h   ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);
 9   ALTER TABLE public.student ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    254    253    254                        2604    30756 
   subject id    DEFAULT     h   ALTER TABLE ONLY public.subject ALTER COLUMN id SET DEFAULT nextval('public.subject_id_seq'::regclass);
 9   ALTER TABLE public.subject ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    256    255    256            !           2604    30765    syllabus id    DEFAULT     j   ALTER TABLE ONLY public.syllabus ALTER COLUMN id SET DEFAULT nextval('public.syllabus_id_seq'::regclass);
 :   ALTER TABLE public.syllabus ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    258    257    258            "           2604    30779    system_config id    DEFAULT     t   ALTER TABLE ONLY public.system_config ALTER COLUMN id SET DEFAULT nextval('public.system_config_id_seq'::regclass);
 ?   ALTER TABLE public.system_config ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    261    260    261            #           2604    30788 
   teacher id    DEFAULT     h   ALTER TABLE ONLY public.teacher ALTER COLUMN id SET DEFAULT nextval('public.teacher_id_seq'::regclass);
 9   ALTER TABLE public.teacher ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    262    263    263            $           2604    30795    transaction id    DEFAULT     p   ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);
 =   ALTER TABLE public.transaction ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    264    265    265            %           2604    30806    used_answer id    DEFAULT     p   ALTER TABLE ONLY public.used_answer ALTER COLUMN id SET DEFAULT nextval('public.used_answer_id_seq'::regclass);
 =   ALTER TABLE public.used_answer ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    266    267    267            &           2604    30813    used_question id    DEFAULT     t   ALTER TABLE ONLY public.used_question ALTER COLUMN id SET DEFAULT nextval('public.used_question_id_seq'::regclass);
 ?   ALTER TABLE public.used_question ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    269    268    269            '           2604    30820 	   wallet id    DEFAULT     f   ALTER TABLE ONLY public.wallet ALTER COLUMN id SET DEFAULT nextval('public.wallet_id_seq'::regclass);
 8   ALTER TABLE public.wallet ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    270    271    271            (           2604    30829    withdrawal_request id    DEFAULT     ~   ALTER TABLE ONLY public.withdrawal_request ALTER COLUMN id SET DEFAULT nextval('public.withdrawal_request_id_seq'::regclass);
 D   ALTER TABLE public.withdrawal_request ALTER COLUMN id DROP DEFAULT;
       public          onlearn    false    272    273    273            G          0    30580    account 
   TABLE DATA                 public          onlearn    false    215   9Y      I          0    30590    answer 
   TABLE DATA                 public          onlearn    false    217   Aa      K          0    30597    course 
   TABLE DATA                 public          onlearn    false    219   hc      L          0    30605    device 
   TABLE DATA                 public          onlearn    false    220   Ol      N          0    30611    enroll 
   TABLE DATA                 public          onlearn    false    222   ��      P          0    30621    feed_content 
   TABLE DATA                 public          onlearn    false    224   Ζ      R          0    30628    feedback 
   TABLE DATA                 public          onlearn    false    226   E�      T          0    30635    feedback_detail 
   TABLE DATA                 public          onlearn    false    228   �      V          0    30644    lesson 
   TABLE DATA                 public          onlearn    false    230   ��      X          0    30654    notification 
   TABLE DATA                 public          onlearn    false    232   �      Z          0    30663    payment_history 
   TABLE DATA                 public          onlearn    false    234   '�      \          0    30673    payment_methods 
   TABLE DATA                 public          onlearn    false    236   ִ      ^          0    30682    profile 
   TABLE DATA                 public          onlearn    false    238   �      `          0    30691    question 
   TABLE DATA                 public          onlearn    false    240    �      b          0    30698    quiz 
   TABLE DATA                 public          onlearn    false    242   ��      �          0    31110    reject 
   TABLE DATA                 public          onlearn    false    276   �      �          0    31130    reject_course 
   TABLE DATA                 public          onlearn    false    278   5�      d          0    30707    report 
   TABLE DATA                 public          onlearn    false    244   �      f          0    30714    resource 
   TABLE DATA                 public          onlearn    false    246   %�      h          0    30723    result_detail 
   TABLE DATA                 public          onlearn    false    248   ��      j          0    30730    result_quiz 
   TABLE DATA                 public          onlearn    false    250   T�      l          0    30737    staff 
   TABLE DATA                 public          onlearn    false    252   S�      n          0    30746    student 
   TABLE DATA                 public          onlearn    false    254   ��      p          0    30753    subject 
   TABLE DATA                 public          onlearn    false    256   ��      r          0    30762    syllabus 
   TABLE DATA                 public          onlearn    false    258   4�      s          0    30770    syllabus_lessons 
   TABLE DATA                 public          onlearn    false    259   �      u          0    30776    system_config 
   TABLE DATA                 public          onlearn    false    261   �      w          0    30785    teacher 
   TABLE DATA                 public          onlearn    false    263   ��      y          0    30792    transaction 
   TABLE DATA                 public          onlearn    false    265   ��      {          0    30803    used_answer 
   TABLE DATA                 public          onlearn    false    267   x�      }          0    30810    used_question 
   TABLE DATA                 public          onlearn    false    269   �                0    30817    wallet 
   TABLE DATA                 public          onlearn    false    271   L�      �          0    30826    withdrawal_request 
   TABLE DATA                 public          onlearn    false    273   ��      �          0    30835    withdrawal_request_transactions 
   TABLE DATA                 public          onlearn    false    274   ��      �           0    0    account_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.account_id_seq', 24, true);
          public          onlearn    false    214            �           0    0    answer_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.answer_id_seq', 199, true);
          public          onlearn    false    216            �           0    0    course_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.course_id_seq', 72, true);
          public          onlearn    false    218            �           0    0    enroll_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.enroll_id_seq', 145, true);
          public          onlearn    false    221            �           0    0    feed_content_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.feed_content_id_seq', 5, true);
          public          onlearn    false    223            �           0    0    feedback_detail_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.feedback_detail_id_seq', 79, true);
          public          onlearn    false    227            �           0    0    feedback_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.feedback_id_seq', 26, true);
          public          onlearn    false    225            �           0    0    lesson_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.lesson_id_seq', 141, true);
          public          onlearn    false    229            �           0    0    notification_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.notification_id_seq', 1, false);
          public          onlearn    false    231            �           0    0    payment_history_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.payment_history_id_seq', 202, true);
          public          onlearn    false    233            �           0    0    payment_methods_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_methods_id_seq', 1, false);
          public          onlearn    false    235            �           0    0    profile_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.profile_id_seq', 31, true);
          public          onlearn    false    237            �           0    0    question_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.question_id_seq', 50, true);
          public          onlearn    false    239            �           0    0    quiz_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.quiz_id_seq', 69, true);
          public          onlearn    false    241            �           0    0    reject_course_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.reject_course_id_seq', 10, true);
          public          onlearn    false    277            �           0    0    reject_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.reject_id_seq', 1, false);
          public          onlearn    false    275            �           0    0    report_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.report_id_seq', 20, true);
          public          onlearn    false    243            �           0    0    resource_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.resource_id_seq', 15, true);
          public          onlearn    false    245            �           0    0    result_detail_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.result_detail_id_seq', 464, true);
          public          onlearn    false    247            �           0    0    result_quiz_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.result_quiz_id_seq', 287, true);
          public          onlearn    false    249            �           0    0    staff_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.staff_id_seq', 1, true);
          public          onlearn    false    251            �           0    0    student_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.student_id_seq', 14, true);
          public          onlearn    false    253            �           0    0    subject_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.subject_id_seq', 32, true);
          public          onlearn    false    255            �           0    0    syllabus_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.syllabus_id_seq', 86, true);
          public          onlearn    false    257            �           0    0    system_config_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.system_config_id_seq', 3, true);
          public          onlearn    false    260            �           0    0    teacher_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.teacher_id_seq', 8, true);
          public          onlearn    false    262            �           0    0    transaction_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.transaction_id_seq', 172, true);
          public          onlearn    false    264            �           0    0    used_answer_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.used_answer_id_seq', 427, true);
          public          onlearn    false    266            �           0    0    used_question_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.used_question_id_seq', 136, true);
          public          onlearn    false    268            �           0    0    wallet_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.wallet_id_seq', 19, true);
          public          onlearn    false    270            �           0    0    withdrawal_request_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.withdrawal_request_id_seq', 5, true);
          public          onlearn    false    272            1           2606    30588    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            onlearn    false    215            7           2606    30595    answer answer_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.answer DROP CONSTRAINT answer_pkey;
       public            onlearn    false    217            9           2606    30604    course course_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public            onlearn    false    219            ;           2606    30609    device device_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (token);
 <   ALTER TABLE ONLY public.device DROP CONSTRAINT device_pkey;
       public            onlearn    false    220            =           2606    30619    enroll enroll_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.enroll
    ADD CONSTRAINT enroll_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.enroll DROP CONSTRAINT enroll_pkey;
       public            onlearn    false    222            ?           2606    30626    feed_content feed_content_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.feed_content
    ADD CONSTRAINT feed_content_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.feed_content DROP CONSTRAINT feed_content_pkey;
       public            onlearn    false    224            E           2606    30642 $   feedback_detail feedback_detail_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.feedback_detail
    ADD CONSTRAINT feedback_detail_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.feedback_detail DROP CONSTRAINT feedback_detail_pkey;
       public            onlearn    false    228            A           2606    30633    feedback feedback_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.feedback DROP CONSTRAINT feedback_pkey;
       public            onlearn    false    226            G           2606    30652    lesson lesson_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.lesson DROP CONSTRAINT lesson_pkey;
       public            onlearn    false    230            I           2606    30661    notification notification_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.notification DROP CONSTRAINT notification_pkey;
       public            onlearn    false    232            K           2606    30671 $   payment_history payment_history_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.payment_history
    ADD CONSTRAINT payment_history_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.payment_history DROP CONSTRAINT payment_history_pkey;
       public            onlearn    false    234            M           2606    30680 $   payment_methods payment_methods_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.payment_methods DROP CONSTRAINT payment_methods_pkey;
       public            onlearn    false    236            O           2606    30689    profile profile_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public            onlearn    false    238            Q           2606    30696    question question_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.question DROP CONSTRAINT question_pkey;
       public            onlearn    false    240            S           2606    30705    quiz quiz_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT quiz_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.quiz DROP CONSTRAINT quiz_pkey;
       public            onlearn    false    242            �           2606    31135     reject_course reject_course_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.reject_course
    ADD CONSTRAINT reject_course_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.reject_course DROP CONSTRAINT reject_course_pkey;
       public            onlearn    false    278                       2606    31115    reject reject_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.reject
    ADD CONSTRAINT reject_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.reject DROP CONSTRAINT reject_pkey;
       public            onlearn    false    276            U           2606    30712    report report_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.report DROP CONSTRAINT report_pkey;
       public            onlearn    false    244            W           2606    30721    resource resource_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.resource DROP CONSTRAINT resource_pkey;
       public            onlearn    false    246            Y           2606    30728     result_detail result_detail_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.result_detail
    ADD CONSTRAINT result_detail_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.result_detail DROP CONSTRAINT result_detail_pkey;
       public            onlearn    false    248            [           2606    30735    result_quiz result_quiz_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.result_quiz
    ADD CONSTRAINT result_quiz_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.result_quiz DROP CONSTRAINT result_quiz_pkey;
       public            onlearn    false    250            ]           2606    30744    staff staff_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            onlearn    false    252            _           2606    30751    student student_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.student DROP CONSTRAINT student_pkey;
       public            onlearn    false    254            c           2606    30760    subject subject_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.subject DROP CONSTRAINT subject_pkey;
       public            onlearn    false    256            g           2606    30774 &   syllabus_lessons syllabus_lessons_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.syllabus_lessons
    ADD CONSTRAINT syllabus_lessons_pkey PRIMARY KEY (syllabus_id, lessons_id);
 P   ALTER TABLE ONLY public.syllabus_lessons DROP CONSTRAINT syllabus_lessons_pkey;
       public            onlearn    false    259    259            e           2606    30769    syllabus syllabus_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.syllabus
    ADD CONSTRAINT syllabus_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.syllabus DROP CONSTRAINT syllabus_pkey;
       public            onlearn    false    258            i           2606    30783     system_config system_config_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.system_config
    ADD CONSTRAINT system_config_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.system_config DROP CONSTRAINT system_config_pkey;
       public            onlearn    false    261            k           2606    30790    teacher teacher_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_pkey;
       public            onlearn    false    263            o           2606    30801    transaction transaction_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pkey;
       public            onlearn    false    265            {           2606    30853 <   withdrawal_request_transactions uk_2faksyjikmnuh2jedlehiir20 
   CONSTRAINT     �   ALTER TABLE ONLY public.withdrawal_request_transactions
    ADD CONSTRAINT uk_2faksyjikmnuh2jedlehiir20 UNIQUE (transactions_id);
 f   ALTER TABLE ONLY public.withdrawal_request_transactions DROP CONSTRAINT uk_2faksyjikmnuh2jedlehiir20;
       public            onlearn    false    274            m           2606    30849 $   teacher uk_8eugmpfm40x0vpuaqpds1ru32 
   CONSTRAINT     e   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT uk_8eugmpfm40x0vpuaqpds1ru32 UNIQUE (account_id);
 N   ALTER TABLE ONLY public.teacher DROP CONSTRAINT uk_8eugmpfm40x0vpuaqpds1ru32;
       public            onlearn    false    263            3           2606    30841 $   account uk_gex1lmaqpg0ir5g1f5eftyaa1 
   CONSTRAINT     c   ALTER TABLE ONLY public.account
    ADD CONSTRAINT uk_gex1lmaqpg0ir5g1f5eftyaa1 UNIQUE (username);
 N   ALTER TABLE ONLY public.account DROP CONSTRAINT uk_gex1lmaqpg0ir5g1f5eftyaa1;
       public            onlearn    false    215            a           2606    30847 $   student uk_h3517npqxa9l44t6qihyalkdy 
   CONSTRAINT     e   ALTER TABLE ONLY public.student
    ADD CONSTRAINT uk_h3517npqxa9l44t6qihyalkdy UNIQUE (account_id);
 N   ALTER TABLE ONLY public.student DROP CONSTRAINT uk_h3517npqxa9l44t6qihyalkdy;
       public            onlearn    false    254            5           2606    30843 $   account uk_lx5o8xa39akufx3vih7fto4gj 
   CONSTRAINT     e   ALTER TABLE ONLY public.account
    ADD CONSTRAINT uk_lx5o8xa39akufx3vih7fto4gj UNIQUE (profile_id);
 N   ALTER TABLE ONLY public.account DROP CONSTRAINT uk_lx5o8xa39akufx3vih7fto4gj;
       public            onlearn    false    215            �           2606    31117 #   reject uk_nhgaxwsjwklylthados2occ12 
   CONSTRAINT     c   ALTER TABLE ONLY public.reject
    ADD CONSTRAINT uk_nhgaxwsjwklylthados2occ12 UNIQUE (course_id);
 M   ALTER TABLE ONLY public.reject DROP CONSTRAINT uk_nhgaxwsjwklylthados2occ12;
       public            onlearn    false    276            u           2606    30851 #   wallet uk_q29lp8vy75l04mpr87j5j62mf 
   CONSTRAINT     d   ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT uk_q29lp8vy75l04mpr87j5j62mf UNIQUE (account_id);
 M   ALTER TABLE ONLY public.wallet DROP CONSTRAINT uk_q29lp8vy75l04mpr87j5j62mf;
       public            onlearn    false    271            C           2606    30845 %   feedback uk_tr2moa4e4w3jjy1w3veajtxg4 
   CONSTRAINT     e   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT uk_tr2moa4e4w3jjy1w3veajtxg4 UNIQUE (enroll_id);
 O   ALTER TABLE ONLY public.feedback DROP CONSTRAINT uk_tr2moa4e4w3jjy1w3veajtxg4;
       public            onlearn    false    226            q           2606    30808    used_answer used_answer_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.used_answer
    ADD CONSTRAINT used_answer_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.used_answer DROP CONSTRAINT used_answer_pkey;
       public            onlearn    false    267            s           2606    30815     used_question used_question_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.used_question
    ADD CONSTRAINT used_question_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.used_question DROP CONSTRAINT used_question_pkey;
       public            onlearn    false    269            w           2606    30824    wallet wallet_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT wallet_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.wallet DROP CONSTRAINT wallet_pkey;
       public            onlearn    false    271            y           2606    30834 *   withdrawal_request withdrawal_request_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.withdrawal_request
    ADD CONSTRAINT withdrawal_request_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.withdrawal_request DROP CONSTRAINT withdrawal_request_pkey;
       public            onlearn    false    273            }           2606    30839 D   withdrawal_request_transactions withdrawal_request_transactions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.withdrawal_request_transactions
    ADD CONSTRAINT withdrawal_request_transactions_pkey PRIMARY KEY (withdrawal_request_id, transactions_id);
 n   ALTER TABLE ONLY public.withdrawal_request_transactions DROP CONSTRAINT withdrawal_request_transactions_pkey;
       public            onlearn    false    274    274            �           2606    30954 $   question fk1sbknhfhhug49n0elkvgk38vs    FK CONSTRAINT     �   ALTER TABLE ONLY public.question
    ADD CONSTRAINT fk1sbknhfhhug49n0elkvgk38vs FOREIGN KEY (lesson_id) REFERENCES public.lesson(id);
 N   ALTER TABLE ONLY public.question DROP CONSTRAINT fk1sbknhfhhug49n0elkvgk38vs;
       public          onlearn    false    3399    230    240            �           2606    31094 ;   withdrawal_request_transactions fk3d41iy2xa77ghrapfc20kktn3    FK CONSTRAINT     �   ALTER TABLE ONLY public.withdrawal_request_transactions
    ADD CONSTRAINT fk3d41iy2xa77ghrapfc20kktn3 FOREIGN KEY (transactions_id) REFERENCES public.transaction(id);
 e   ALTER TABLE ONLY public.withdrawal_request_transactions DROP CONSTRAINT fk3d41iy2xa77ghrapfc20kktn3;
       public          onlearn    false    3439    274    265            �           2606    31084 "   wallet fk4q1fs3jihuicq5afy27cy2gk9    FK CONSTRAINT     �   ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT fk4q1fs3jihuicq5afy27cy2gk9 FOREIGN KEY (account_id) REFERENCES public.account(id);
 L   ALTER TABLE ONLY public.wallet DROP CONSTRAINT fk4q1fs3jihuicq5afy27cy2gk9;
       public          onlearn    false    3377    215    271            �           2606    31069 '   transaction fk573qptb08fg7edqcp9rblgin1    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk573qptb08fg7edqcp9rblgin1 FOREIGN KEY (withdraw_request_id) REFERENCES public.withdrawal_request(id);
 Q   ALTER TABLE ONLY public.transaction DROP CONSTRAINT fk573qptb08fg7edqcp9rblgin1;
       public          onlearn    false    3449    273    265            �           2606    31044 #   teacher fk5t4vdu18ohx39bj4lef9qf779    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT fk5t4vdu18ohx39bj4lef9qf779 FOREIGN KEY (account_id) REFERENCES public.account(id);
 M   ALTER TABLE ONLY public.teacher DROP CONSTRAINT fk5t4vdu18ohx39bj4lef9qf779;
       public          onlearn    false    263    3377    215            �           2606    30899 +   feedback_detail fk5vv45kk7raofnf6jx83aox8sb    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback_detail
    ADD CONSTRAINT fk5vv45kk7raofnf6jx83aox8sb FOREIGN KEY (feed_content_id) REFERENCES public.feed_content(id);
 U   ALTER TABLE ONLY public.feedback_detail DROP CONSTRAINT fk5vv45kk7raofnf6jx83aox8sb;
       public          onlearn    false    224    3391    228            �           2606    31024 #   subject fk67ailg68kbxbd3peyske9d61p    FK CONSTRAINT     �   ALTER TABLE ONLY public.subject
    ADD CONSTRAINT fk67ailg68kbxbd3peyske9d61p FOREIGN KEY (staff_id) REFERENCES public.staff(id);
 M   ALTER TABLE ONLY public.subject DROP CONSTRAINT fk67ailg68kbxbd3peyske9d61p;
       public          onlearn    false    3421    252    256            �           2606    30974 "   report fk6npdt1mupqnvem0csel7t0yth    FK CONSTRAINT     �   ALTER TABLE ONLY public.report
    ADD CONSTRAINT fk6npdt1mupqnvem0csel7t0yth FOREIGN KEY (teacher_id) REFERENCES public.teacher(id);
 L   ALTER TABLE ONLY public.report DROP CONSTRAINT fk6npdt1mupqnvem0csel7t0yth;
       public          onlearn    false    244    3435    263            �           2606    31074 '   used_answer fk6vru351l069rwriwiyr3hoe10    FK CONSTRAINT     �   ALTER TABLE ONLY public.used_answer
    ADD CONSTRAINT fk6vru351l069rwriwiyr3hoe10 FOREIGN KEY (used_question_id) REFERENCES public.used_question(id);
 Q   ALTER TABLE ONLY public.used_answer DROP CONSTRAINT fk6vru351l069rwriwiyr3hoe10;
       public          onlearn    false    267    269    3443            �           2606    31079 )   used_question fk87qu1xdv1xs28m301rfdrwp1g    FK CONSTRAINT     �   ALTER TABLE ONLY public.used_question
    ADD CONSTRAINT fk87qu1xdv1xs28m301rfdrwp1g FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);
 S   ALTER TABLE ONLY public.used_question DROP CONSTRAINT fk87qu1xdv1xs28m301rfdrwp1g;
       public          onlearn    false    242    3411    269            �           2606    30939 +   payment_history fk8e07n49hxe6l8hb8vp7s5cyry    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment_history
    ADD CONSTRAINT fk8e07n49hxe6l8hb8vp7s5cyry FOREIGN KEY (wallet_id) REFERENCES public.wallet(id);
 U   ALTER TABLE ONLY public.payment_history DROP CONSTRAINT fk8e07n49hxe6l8hb8vp7s5cyry;
       public          onlearn    false    234    3447    271            �           2606    30859 "   answer fk8frr4bcabmmeyyu60qt7iiblo    FK CONSTRAINT     �   ALTER TABLE ONLY public.answer
    ADD CONSTRAINT fk8frr4bcabmmeyyu60qt7iiblo FOREIGN KEY (question_id) REFERENCES public.question(id);
 L   ALTER TABLE ONLY public.answer DROP CONSTRAINT fk8frr4bcabmmeyyu60qt7iiblo;
       public          onlearn    false    240    3409    217            �           2606    31059 '   transaction fk8uun3s15rb4ujhrh1lck4wwiq    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk8uun3s15rb4ujhrh1lck4wwiq FOREIGN KEY (teacher_id) REFERENCES public.teacher(id);
 Q   ALTER TABLE ONLY public.transaction DROP CONSTRAINT fk8uun3s15rb4ujhrh1lck4wwiq;
       public          onlearn    false    265    263    3435            �           2606    31029 $   syllabus fk93wen23g8ihus3o6ghey8ybd6    FK CONSTRAINT     �   ALTER TABLE ONLY public.syllabus
    ADD CONSTRAINT fk93wen23g8ihus3o6ghey8ybd6 FOREIGN KEY (course_id) REFERENCES public.course(id);
 N   ALTER TABLE ONLY public.syllabus DROP CONSTRAINT fk93wen23g8ihus3o6ghey8ybd6;
       public          onlearn    false    219    258    3385            �           2606    30904 +   feedback_detail fk9kdj80tqen9e7nbnj13vnk661    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback_detail
    ADD CONSTRAINT fk9kdj80tqen9e7nbnj13vnk661 FOREIGN KEY (feedback_id) REFERENCES public.feedback(id);
 U   ALTER TABLE ONLY public.feedback_detail DROP CONSTRAINT fk9kdj80tqen9e7nbnj13vnk661;
       public          onlearn    false    3393    228    226            �           2606    30874 "   device fkaigctov0rj5f048cd1ckauoov    FK CONSTRAINT     �   ALTER TABLE ONLY public.device
    ADD CONSTRAINT fkaigctov0rj5f048cd1ckauoov FOREIGN KEY (account_id) REFERENCES public.account(id);
 L   ALTER TABLE ONLY public.device DROP CONSTRAINT fkaigctov0rj5f048cd1ckauoov;
       public          onlearn    false    3377    215    220            �           2606    31118 "   reject fkb2eeoeo39c5r1cixjk8tdvd33    FK CONSTRAINT     �   ALTER TABLE ONLY public.reject
    ADD CONSTRAINT fkb2eeoeo39c5r1cixjk8tdvd33 FOREIGN KEY (course_id) REFERENCES public.course(id);
 L   ALTER TABLE ONLY public.reject DROP CONSTRAINT fkb2eeoeo39c5r1cixjk8tdvd33;
       public          onlearn    false    219    3385    276            �           2606    31009 '   result_quiz fkb35rig40rp05so2d13kks0ck2    FK CONSTRAINT     �   ALTER TABLE ONLY public.result_quiz
    ADD CONSTRAINT fkb35rig40rp05so2d13kks0ck2 FOREIGN KEY (student_id) REFERENCES public.student(id);
 Q   ALTER TABLE ONLY public.result_quiz DROP CONSTRAINT fkb35rig40rp05so2d13kks0ck2;
       public          onlearn    false    250    3423    254            �           2606    30894 $   feedback fkcwc1p14qs0abvwsjpo8f6ihpf    FK CONSTRAINT     �   ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT fkcwc1p14qs0abvwsjpo8f6ihpf FOREIGN KEY (enroll_id) REFERENCES public.enroll(id);
 N   ALTER TABLE ONLY public.feedback DROP CONSTRAINT fkcwc1p14qs0abvwsjpo8f6ihpf;
       public          onlearn    false    3389    226    222            �           2606    31054 '   transaction fkd71rhpdlg8cjw7byfd16lg304    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fkd71rhpdlg8cjw7byfd16lg304 FOREIGN KEY (student_id) REFERENCES public.student(id);
 Q   ALTER TABLE ONLY public.transaction DROP CONSTRAINT fkd71rhpdlg8cjw7byfd16lg304;
       public          onlearn    false    3423    265    254            �           2606    30924 +   payment_history fkd9anq3f2af6e2hm2onbrh8hcb    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment_history
    ADD CONSTRAINT fkd9anq3f2af6e2hm2onbrh8hcb FOREIGN KEY (account_id) REFERENCES public.account(id);
 U   ALTER TABLE ONLY public.payment_history DROP CONSTRAINT fkd9anq3f2af6e2hm2onbrh8hcb;
       public          onlearn    false    215    234    3377            �           2606    30999 '   result_quiz fkdrbxnuc05lfv1c3te2r1fli9g    FK CONSTRAINT     �   ALTER TABLE ONLY public.result_quiz
    ADD CONSTRAINT fkdrbxnuc05lfv1c3te2r1fli9g FOREIGN KEY (enroll_id) REFERENCES public.enroll(id);
 Q   ALTER TABLE ONLY public.result_quiz DROP CONSTRAINT fkdrbxnuc05lfv1c3te2r1fli9g;
       public          onlearn    false    3389    250    222            �           2606    31039 ,   syllabus_lessons fkfdvew6in3sga1q2r1m0dl8umo    FK CONSTRAINT     �   ALTER TABLE ONLY public.syllabus_lessons
    ADD CONSTRAINT fkfdvew6in3sga1q2r1m0dl8umo FOREIGN KEY (syllabus_id) REFERENCES public.syllabus(id);
 V   ALTER TABLE ONLY public.syllabus_lessons DROP CONSTRAINT fkfdvew6in3sga1q2r1m0dl8umo;
       public          onlearn    false    259    3429    258            �           2606    31034 ,   syllabus_lessons fkgfbxy2ocb5uy92li4gckd3r8x    FK CONSTRAINT     �   ALTER TABLE ONLY public.syllabus_lessons
    ADD CONSTRAINT fkgfbxy2ocb5uy92li4gckd3r8x FOREIGN KEY (lessons_id) REFERENCES public.lesson(id);
 V   ALTER TABLE ONLY public.syllabus_lessons DROP CONSTRAINT fkgfbxy2ocb5uy92li4gckd3r8x;
       public          onlearn    false    259    3399    230            �           2606    30959 $   question fkgnm83qijywvywwgsmi39x9wth    FK CONSTRAINT     �   ALTER TABLE ONLY public.question
    ADD CONSTRAINT fkgnm83qijywvywwgsmi39x9wth FOREIGN KEY (teacher_id) REFERENCES public.teacher(id);
 N   ALTER TABLE ONLY public.question DROP CONSTRAINT fkgnm83qijywvywwgsmi39x9wth;
       public          onlearn    false    240    263    3435            �           2606    30979 $   resource fkgpi9gjtubx2nwit2971txbqrm    FK CONSTRAINT     �   ALTER TABLE ONLY public.resource
    ADD CONSTRAINT fkgpi9gjtubx2nwit2971txbqrm FOREIGN KEY (lesson_id) REFERENCES public.lesson(id);
 N   ALTER TABLE ONLY public.resource DROP CONSTRAINT fkgpi9gjtubx2nwit2971txbqrm;
       public          onlearn    false    3399    230    246            �           2606    31089 .   withdrawal_request fkhl7tyfb6hhweko77moabsj0cf    FK CONSTRAINT     �   ALTER TABLE ONLY public.withdrawal_request
    ADD CONSTRAINT fkhl7tyfb6hhweko77moabsj0cf FOREIGN KEY (teacher_id) REFERENCES public.teacher(id);
 X   ALTER TABLE ONLY public.withdrawal_request DROP CONSTRAINT fkhl7tyfb6hhweko77moabsj0cf;
       public          onlearn    false    3435    263    273            �           2606    30929 +   payment_history fkhr2babwsdwy7195bc52gv2lu2    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment_history
    ADD CONSTRAINT fkhr2babwsdwy7195bc52gv2lu2 FOREIGN KEY (student_id) REFERENCES public.student(id);
 U   ALTER TABLE ONLY public.payment_history DROP CONSTRAINT fkhr2babwsdwy7195bc52gv2lu2;
       public          onlearn    false    254    3423    234            �           2606    30964     quiz fki10d7n4lf738sm3mon21aubik    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz
    ADD CONSTRAINT fki10d7n4lf738sm3mon21aubik FOREIGN KEY (lesson_id) REFERENCES public.lesson(id);
 J   ALTER TABLE ONLY public.quiz DROP CONSTRAINT fki10d7n4lf738sm3mon21aubik;
       public          onlearn    false    242    230    3399            �           2606    30944 +   payment_methods fkift1jlxbanqou688hu2rgr0rx    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT fkift1jlxbanqou688hu2rgr0rx FOREIGN KEY (account_id) REFERENCES public.account(id);
 U   ALTER TABLE ONLY public.payment_methods DROP CONSTRAINT fkift1jlxbanqou688hu2rgr0rx;
       public          onlearn    false    236    3377    215            �           2606    30879 "   enroll fkiv2pkft2ab8mqx9ffc4ex4q7e    FK CONSTRAINT     �   ALTER TABLE ONLY public.enroll
    ADD CONSTRAINT fkiv2pkft2ab8mqx9ffc4ex4q7e FOREIGN KEY (course_id) REFERENCES public.course(id);
 L   ALTER TABLE ONLY public.enroll DROP CONSTRAINT fkiv2pkft2ab8mqx9ffc4ex4q7e;
       public          onlearn    false    3385    219    222            �           2606    30914 (   notification fkj0b1ncedmpl7sx7t7o54t26v2    FK CONSTRAINT     �   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT fkj0b1ncedmpl7sx7t7o54t26v2 FOREIGN KEY (account_id) REFERENCES public.account(id);
 R   ALTER TABLE ONLY public.notification DROP CONSTRAINT fkj0b1ncedmpl7sx7t7o54t26v2;
       public          onlearn    false    215    232    3377            �           2606    30934 +   payment_history fkj54f7gs9qssdi9rfiujnktof0    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment_history
    ADD CONSTRAINT fkj54f7gs9qssdi9rfiujnktof0 FOREIGN KEY (teacher_id) REFERENCES public.teacher(id);
 U   ALTER TABLE ONLY public.payment_history DROP CONSTRAINT fkj54f7gs9qssdi9rfiujnktof0;
       public          onlearn    false    3435    234    263            �           2606    30909 "   lesson fkjs3c7skmg8bvdddok5lc7s807    FK CONSTRAINT     �   ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fkjs3c7skmg8bvdddok5lc7s807 FOREIGN KEY (course_id) REFERENCES public.course(id);
 L   ALTER TABLE ONLY public.lesson DROP CONSTRAINT fkjs3c7skmg8bvdddok5lc7s807;
       public          onlearn    false    219    230    3385            �           2606    30994 )   result_detail fkjt9aw5u9h5g749psiqrjg2j2w    FK CONSTRAINT     �   ALTER TABLE ONLY public.result_detail
    ADD CONSTRAINT fkjt9aw5u9h5g749psiqrjg2j2w FOREIGN KEY (used_question_id) REFERENCES public.used_question(id);
 S   ALTER TABLE ONLY public.result_detail DROP CONSTRAINT fkjt9aw5u9h5g749psiqrjg2j2w;
       public          onlearn    false    3443    269    248            �           2606    31136 )   reject_course fkkk2o2opqbmh4jrj4f2k80u67v    FK CONSTRAINT     �   ALTER TABLE ONLY public.reject_course
    ADD CONSTRAINT fkkk2o2opqbmh4jrj4f2k80u67v FOREIGN KEY (course_id) REFERENCES public.course(id);
 S   ALTER TABLE ONLY public.reject_course DROP CONSTRAINT fkkk2o2opqbmh4jrj4f2k80u67v;
       public          onlearn    false    3385    219    278            �           2606    30969 "   report fkl6ssom7r83r8bofvdkjkp18pj    FK CONSTRAINT     �   ALTER TABLE ONLY public.report
    ADD CONSTRAINT fkl6ssom7r83r8bofvdkjkp18pj FOREIGN KEY (student_id) REFERENCES public.student(id);
 L   ALTER TABLE ONLY public.report DROP CONSTRAINT fkl6ssom7r83r8bofvdkjkp18pj;
       public          onlearn    false    244    254    3423            �           2606    30854 #   account fklelt1dhpyk7dqxdco3x3cd5ub    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT fklelt1dhpyk7dqxdco3x3cd5ub FOREIGN KEY (profile_id) REFERENCES public.profile(id);
 M   ALTER TABLE ONLY public.account DROP CONSTRAINT fklelt1dhpyk7dqxdco3x3cd5ub;
       public          onlearn    false    215    3407    238            �           2606    30864 "   course fkm1expnaas0onmafqpktmjixnx    FK CONSTRAINT     �   ALTER TABLE ONLY public.course
    ADD CONSTRAINT fkm1expnaas0onmafqpktmjixnx FOREIGN KEY (subject_id) REFERENCES public.subject(id);
 L   ALTER TABLE ONLY public.course DROP CONSTRAINT fkm1expnaas0onmafqpktmjixnx;
       public          onlearn    false    3427    256    219            �           2606    30989 )   result_detail fkm97tdvxlhmtx18w203si784s1    FK CONSTRAINT     �   ALTER TABLE ONLY public.result_detail
    ADD CONSTRAINT fkm97tdvxlhmtx18w203si784s1 FOREIGN KEY (used_answer_id) REFERENCES public.used_answer(id);
 S   ALTER TABLE ONLY public.result_detail DROP CONSTRAINT fkm97tdvxlhmtx18w203si784s1;
       public          onlearn    false    3441    248    267            �           2606    30949 $   question fknbqlwvoi94mkynn6c3r5h8dlg    FK CONSTRAINT     �   ALTER TABLE ONLY public.question
    ADD CONSTRAINT fknbqlwvoi94mkynn6c3r5h8dlg FOREIGN KEY (course_id) REFERENCES public.course(id);
 N   ALTER TABLE ONLY public.question DROP CONSTRAINT fknbqlwvoi94mkynn6c3r5h8dlg;
       public          onlearn    false    240    219    3385            �           2606    31099 ;   withdrawal_request_transactions fko95asjga40q2cxwd8dt4jxk79    FK CONSTRAINT     �   ALTER TABLE ONLY public.withdrawal_request_transactions
    ADD CONSTRAINT fko95asjga40q2cxwd8dt4jxk79 FOREIGN KEY (withdrawal_request_id) REFERENCES public.withdrawal_request(id);
 e   ALTER TABLE ONLY public.withdrawal_request_transactions DROP CONSTRAINT fko95asjga40q2cxwd8dt4jxk79;
       public          onlearn    false    3449    274    273            �           2606    31019 #   student fkoootcgotavmpat2yv9o52wx1q    FK CONSTRAINT     �   ALTER TABLE ONLY public.student
    ADD CONSTRAINT fkoootcgotavmpat2yv9o52wx1q FOREIGN KEY (account_id) REFERENCES public.account(id);
 M   ALTER TABLE ONLY public.student DROP CONSTRAINT fkoootcgotavmpat2yv9o52wx1q;
       public          onlearn    false    215    3377    254            �           2606    30919 (   notification fkopnvuweg49llrxcdnh7k47kt9    FK CONSTRAINT     �   ALTER TABLE ONLY public.notification
    ADD CONSTRAINT fkopnvuweg49llrxcdnh7k47kt9 FOREIGN KEY (student_id) REFERENCES public.student(id);
 R   ALTER TABLE ONLY public.notification DROP CONSTRAINT fkopnvuweg49llrxcdnh7k47kt9;
       public          onlearn    false    3423    254    232            �           2606    30984 )   result_detail fkqjnaaop9v8os5v10lildb49ne    FK CONSTRAINT     �   ALTER TABLE ONLY public.result_detail
    ADD CONSTRAINT fkqjnaaop9v8os5v10lildb49ne FOREIGN KEY (result_quiz_id) REFERENCES public.result_quiz(id);
 S   ALTER TABLE ONLY public.result_detail DROP CONSTRAINT fkqjnaaop9v8os5v10lildb49ne;
       public          onlearn    false    248    3419    250            �           2606    30884 "   enroll fkr5hq653kinipvyshfdl738ouc    FK CONSTRAINT     �   ALTER TABLE ONLY public.enroll
    ADD CONSTRAINT fkr5hq653kinipvyshfdl738ouc FOREIGN KEY (student_id) REFERENCES public.student(id);
 L   ALTER TABLE ONLY public.enroll DROP CONSTRAINT fkr5hq653kinipvyshfdl738ouc;
       public          onlearn    false    3423    222    254            �           2606    31004 '   result_quiz fkrsn0ubkknejds4mjb85ywmbbe    FK CONSTRAINT     �   ALTER TABLE ONLY public.result_quiz
    ADD CONSTRAINT fkrsn0ubkknejds4mjb85ywmbbe FOREIGN KEY (quiz_id) REFERENCES public.quiz(id);
 Q   ALTER TABLE ONLY public.result_quiz DROP CONSTRAINT fkrsn0ubkknejds4mjb85ywmbbe;
       public          onlearn    false    250    242    3411            �           2606    31014 !   staff fks9jl798sgmtrl79dm4svocvaw    FK CONSTRAINT     �   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT fks9jl798sgmtrl79dm4svocvaw FOREIGN KEY (account_id) REFERENCES public.account(id);
 K   ALTER TABLE ONLY public.staff DROP CONSTRAINT fks9jl798sgmtrl79dm4svocvaw;
       public          onlearn    false    3377    252    215            �           2606    30889 "   enroll fksvnx3fi087ynewe9qrlb25q0l    FK CONSTRAINT     �   ALTER TABLE ONLY public.enroll
    ADD CONSTRAINT fksvnx3fi087ynewe9qrlb25q0l FOREIGN KEY (syllabus_id) REFERENCES public.syllabus(id);
 L   ALTER TABLE ONLY public.enroll DROP CONSTRAINT fksvnx3fi087ynewe9qrlb25q0l;
       public          onlearn    false    3429    222    258            �           2606    30869 "   course fksybhlxoejr4j3teomm5u2bx1n    FK CONSTRAINT     �   ALTER TABLE ONLY public.course
    ADD CONSTRAINT fksybhlxoejr4j3teomm5u2bx1n FOREIGN KEY (teacher_id) REFERENCES public.teacher(id);
 L   ALTER TABLE ONLY public.course DROP CONSTRAINT fksybhlxoejr4j3teomm5u2bx1n;
       public          onlearn    false    3435    263    219            �           2606    31064 '   transaction fktfwlfspv2h4wcgc9rjd1658a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fktfwlfspv2h4wcgc9rjd1658a6 FOREIGN KEY (wallet_id) REFERENCES public.wallet(id);
 Q   ALTER TABLE ONLY public.transaction DROP CONSTRAINT fktfwlfspv2h4wcgc9rjd1658a6;
       public          onlearn    false    265    271    3447            �           2606    31049 &   transaction fkve66nrajs1mw1848g4rhrcig    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fkve66nrajs1mw1848g4rhrcig FOREIGN KEY (enroll_id) REFERENCES public.enroll(id);
 P   ALTER TABLE ONLY public.transaction DROP CONSTRAINT fkve66nrajs1mw1848g4rhrcig;
       public          onlearn    false    265    222    3389            G   �  x��Xɒ�H��Wph�궩b�B̉$� %R��MH,ml_?��̚$K��3�x��?1���6[F�X������8���?j^8y����?j~�>�G��s�ˣS�vt��|Hŷ��N��,Hcg_~�V�.�'����6�Y׬�IԾc����W��L\��������L����<-ď|�; �G����\�uv�'� �U���׉q���혛E>�M���]��"�?�s������i�H�O-�k��pL�R�Mu�=4U����S�H�7��ix��36]��Hͬ�cxO��v.V?ޡ���b���
����KNP*^��
´�e��L&7�'���t�ȇ���I���慣�����k�d1I�S�؟K��&v!b�x]\�X,~.:��c�(*a*�/p�V}���۫�0�6��l�O[� �.>��Nd^���(�W-������N�t/�7� �\x�	E2Q�Jx0�!��E�$�pƫ���Yk��%�-��?���;
�L��b0�^���Q[,��gN�إ$���7�<� &�Y%4� j@^ʊB�h��As?�#=6����p>�4\;�5�s/oҪrif���^ݕ���މ�u��Dz.o���x�@�$	*զ�iM@a�a !�X��ps��𝖰[,o[7�n�[�#�/�Ѥ��2?
;�Ӌ��4Z���7�S&%Z�s��O�J�m0�	��ϣ�{��8����rv���'�:/��qC68v`ߑ����JtCj%;#o�;O��3@�>$���6�̐,�#��~�݃��-j��ף�i��vh��#p�M����`QLԠێ�흰/�`e�gV��,��&�q�4^��9~ �\����@�J{v�~/���F�M��7AF����[\�Xc�����%��k�:�/������<�hѼR��1/�!E� �)"�����Э���E�:ô׃�̯c}z�@�A85x:w��=�z:�w�r���9b�d�@ #I�����%�[=����{v�&/R�����N�i�E2��+� ?����w�9�7�y.{�b�r��b�(�� )��MEr�n�=c���@�vqX�1�^��<�k��5�Zz|9io{�;{CS}�jj_ �����=#a+�t������(!�@��(@�Jre[���8%�C������H#À���b��R�sZߏ���Q���=�x�����o�����ތ����@��@�Jh�X���+6��Zl2i��%۶sú��T�U,��a�j0H�8v�����v�8b����9�{�S�TE	�TiL�$�jP(�e�� ��~w赂����t}�]������6�
7��l�l^�b�g�4�o��� �\��-^���`(PD��շ"p�VGQ	d��`*/�mP��_�;M��f���V����σ������g#F-�r�����!�Rj�О{���gn��������go00.ӏ$�rv��!~�5쓭�a}���u;J��Y�\񰓤I�<����L62�����ΡQ
�CX�yn��<h�_{�&,aDУ&�ޮ0J�W�#�u%���E;�/��:�è^h�u~�P��u�).����)��t�*>n?V6�'��Jyw�a���kkiYf��V}�Yh�w���K��O���O�M���d�Tf6iuܛ��`N�e�N�o�ync���C� P!yx�bRE�3J�:+B5	�H�;��6ٷ٠�	�l�IE�ܘS��7+Ll��|aO�����;��#Ύ��p��O�$e����'Tm�u���e��)e)s뻥��-�1��ǅjؽh�8���f�%������ľ�\�/�ָ���cU�����ܳ��ph�Y�Y`uG��^��n�ۑ7�lN�I�ʕ�����_ ����ş��W��4�|*h�p"=�f)o��T��k���v;��p�2���tV�c�/��
�}`L�{�������8q{>�!/*�׷o����      I     x����j�@�bnI@�և�AC ��(4i��Rz	�ZE�J�V	:��SZ�u���M��Efr����o��3�nt�ob���wP6˜����
��� V�
i ��XQU)Sߟ����w|u���ކ86ݩG��}��<;2�S�ש�y�j�)�Nq�U<�E��v�9���;F�x;�Ҋ���b�*���uZě�k�(��W�b����*6��Xq�%����O�<��3Z�ó+>^b�J0,1}����;?z�Er�-����W�o���i�ǯ���>����׭�
1.gR�E���Y��^���/��s�5�1/��Fp�B��O?�S=ZU������TJ`݆A���*K}��xz��撯�&��;��GUV�>��\Uצ������=ԧE�\z�Ձr�O�����r0E��a9�&b^.�q��5ojY���Z&y� �к6��������oh/B��-9K�����59	��er6�U<��B����Z	��11�Z�+��q��C�I�L���v�      K   �  x��Yˎ���+*e$�Eգ����a�4�565�<#�fP]UM��~�3�R�"+/���0�h,��"ě!x����?ɭ&)���@̀�dwu=�9uﹷw���z�v����:ƪ���(���G��=s�gqZ��*��̡�CiS�"Ϋ8K[(N�Y�$��8�充Ǽ���JVu	�:�gTuh;��T}S����������+Z�m�-Fǔb�#F;���8tnu��OsT���>�'�$RYa��g(����Q�����_c۸_Uyٹr%��ҔUf��eYohd�������68R	�uశ��2Ϫ�vv�@�"���Ev�2_Vp�Cc;4J܋q&�RIm��!k��{�a�Abt,_e�~L/���c'�.%X:�Ǖ��H�7eo\(�e���&��v?�n��s�v7Of����n��I�O����B7������i�8���>�,���Pi��X0�c�� :v8�B��p�Y��$�f%� �}}ogw�#�l�����wy����k�o�d:y4B�����v�����/uc0�I�����h�Lgk����7k�s
����j�������c��Co}{z���К�����O��������t� ���T�	L��19Qh:�n�[�L7��I{0���U������p�h6bڟ������b�E.2r�^^�HJ�4����p�=�#`jH��8�����5ͷ͂OL�Z��q��[�P���rPd�V�,^��j�C������� �����s^U������.ޑ���ܔ�<=��jz�	�Bdp9�D9�3Q�9�r��ù�<�򋡽�.�۹�=�6=��隠�_%n5�<�G��œ�^v:~"W�}{T��u��>�[��I}�H
�A@��kQ6�12�&J�8�� p"�;JɐK+r�kvY,m�|���n�8�W@��7m6�r<M�ݎ㶙�i:6	���:Aq��8ɇ#��$��EYa�ؑ�
�d�Qe�����q��*Fm��U_�(4&m�]4��*��S-�<���ȩ2Ms��`q�}x\��Niv��f �, �zr84�fz0�fZ`A��C�QAD�����27
��?�R�e����`��~ �2�8�Ď�B�(��0�̰0tL�7�u�U5�t�����${�m�N�0wC]�-v���CI���p�&st��t$�~`h�g�M�J��C�T��[3/�	�.�|��ø�g ��f�h��l��5;�zM��Q��
ͣ�oI�W��7ӆw��U@<�ϓ�B��+����q��W�T����2"���	���ё��1��\�v�d��Y�{K^�l(%�3^�zti��^彎|��4��ҵ�$$���
�\�	9���,b�h�%'� �ֺr����L���8A��8��H���9BC��Dh���d�pdЍa]�C�:B��3���2"����Z@���P�9��(?�2�$��g���P�p8Һ�x�m��6GY���u8n��� ��A���g���w:�7;b�����Ӓc����wp�@g��q�!Õ���|_�����"�J�s&����n �������Z>�9=��^-ɂwV:�ɮ�N�~�Z/�m	-��z#
a.D;�`���-]�'q�z�2-ܹ�|����������{ɲ�����jIf���2l^:Q�Ӧ�/�F+��
��uϕu��+�9#�j=�u�$����34�a&5�����Ը�x�Z��w):�$VGA���bm�B�{�ٶ$�MI%Xv��rN���k�_�/j��,�r������
k���w49IW�ol�.��Z�K>�K6����ϳB�)K���hܘ3�_/�B�)��	)v�Pc�>&\��hH8�B�I)!��b��!p�s�[��;�/ܬ{�Ӵ�}C*cEv�VѴ�v\�i�BW�2��ھ����Gqu��[��:�y�J�/\�@��%SXEb����$�1,F�-F-�SԹ���Y���Z�>+�yG� +$�gZ'0�M`�`�#3�rS�HYm�H>��b��;�ܺx�_��s����Xщ����:>���g�h�)=�|g.a��G	�2c�2�vV�
�ϲ~Y�S7�t!���u�`I����w��v\A�uA�z �����}J��(���w�K�^6UFxt�����(�t ��Z-Ý'X]||]�e��e�z���J��}l����9��u˂�[����
���܅��b�      L      x���G҄J�%8��gUeV��E��D�h��H`����}w؃�p�#<<$��,�?�������o��+/�&+��?��+����$˦c��&�_��h�������Q���6v�Q���薐#���oڠ)(�%`���\ި���������11l�5����R��h��:�͖6a��U#����e�L+D<NrG�Fd��(M5�!T�s�����
	� �+t����������/����� �o���d�9o1��
�����N/�B=)��/��^��o�;p;�R��4�0g6ǳ�;��ԝ�'�h��M�V��;�8�[�{1�l�l��1�i�"�\��P�NJEr��w��������/�Ihx��#�~�@��(v��bz,ݭ���j�RX�5붨h��E� PH4��A����H�#��v��*�ħ�t�@S��um���)��c�^ir᱀֠7͛7�;@��RT��  ��YC��I��!R!A�DE���Kc�-�����qM����z�nۀ��VI�3N�g"�2%%?V��(���!A��v������;A��`"(6!l�i�;�Fu ��7�]��&�[�����0��̭8�s����M�9Cs�w`���F���$�����O-[]F�����N�C���C��=rMU�
�Ѹkט��{m�w�%�>w�n�wԢ���c-�\����81��r~Ȃ�7M�%��/c(�p���As�&�-����CWzB'�8\�~����9���Dc��_�E� �gC�:���(�Cޖ��8��j�Cѯ)^���*ԃOQ�)�mи�4y+YĶ���`4q*Q?�mrl����׃��nڕ�}�h��K�a��uλ��R�vPJme��z��}�f8^�(���R������Xv�}
�x���ܽB����fAL�~�ޙi��>)C.h":���E���N�[���ƿ뗂��h���1�m���$Z��,�m��g  �ȓ�Uz/�r�P����؞bk�k��f�:@�[�mqm�+�+7��oڎ*5�&��X�Mf��lf��<K3�e
��S���d�S�J^(�9:�eZ�]ab���Ψ���0���U\0_X\A�����o!�Z�e�;�����C�8b�Dj�4�7���S(�ݫY���� X(Y�K��1��[�f��ɔ����H�󱰿T�"�yWJ�#�a�feO�.
o�ɏ�(�	���+?4Q���/���m��U�S����c�ʇ��E&����!�A܍�t��C�8��ǻ���K�y�7��\}0x�
)k.��,�=�����0]��2���W<���t���Go�g�e��I�����0�v���="�n<܊6J^:�X��X!m�;��V��^�U�i
����:��SJ~.�n�z	��}�x�HT�(0�8�UVo���	�`첍�~���8WGz��t�>{�S)�	�(�R��8�g���C�����v����m����Y;8Eu�z�R���^�w��ehK����z�C5��6$����Q�K7�1�[Ab_z�ZKx�����V��t������E�fWP	��r�t�����H�α�
?Y�#31F�����3tI��Q�J-��^��0� �aٿ/b�v�s��J�����=ˋ�nI���dJ��wpB�U؇~��m O��rd��t�C�,��(V�7]�~ϟ�9�3}_wԎD�8�tj_��2���*�k�8�%Y��dk�'PQ���ƻ�w0Ҥ	�tD'�-�
������	�b�H�A��M@B�AVhv���w�\�/"U#@upw�8/v�%��	��ބ�D���Fge��3P�7P_-��_^�T��+;���F���8'���۔��V5��U/G�Ɠ���
�~8w��.���6ҜA�T�ϋ�)
$m�"�mʡ��z��i��5���-�ն`ك�_P�1��o�<��o�=:my��Y�d��a#ڹ�Ҍ~ s%�"{!dZճ#��A3R��� H����J?� e��J�������l�:�3�����^�g�$�����gP!S�k�#�-����k�ׁ�O��d�phsRj��A��x+�SĠ���sT�k�Nq����
f?W ��*��!�5--k8�����anv��}�E���y�u2�a�Upо�_��W�z��&"q^s�;q'f�	� � ��QY���w�~��Ѵ|׊A�X`8�v�v����A���hh3�����%�I`�[?ٞ����a���]���R�t��+Q�����k#N{RY��jg��(���˾�����"]}�����;r����,TS�y�]P�W��T��OO�Q�]1���)6�F79�Ѵ��W�r1��d_Bq3���Q�H����#Ȧ��I�>�ȵ�^թ�6��~��c�i�
��b~)M�d�7ީ��k�v�c�:�%d��=,˶�JP�=�����ɔG!��1��i�3�Q�/�k��d�0����8SH�-Ѓ��&PС�� G	��
�׿�z��Sn��3�`��}�y��sа��Ķ%S��w}��^�Q�v��Q��J�Q�}|�;-�&A�E��;y �~��X\�|�u<�!�}��c+�J�K�Q��z2��P�N���t;��N�ho��kz�ca�)�$��sq��k-u����h�yԬ��:���`�@��-�'	?�s#i����6l?�sD|�Z�D�|���ɟc�� ���h����c\���!�a�OF�$l<���ol��_������U������6C���a�v���x;f��M�1`�)@K�=L!�_Ə���o�,��#�O�qO��C�ze�"��gn?=�n�Q�Ȣ�aV���T(\!�A�AV��_�*�����P&�\�bYhF�H�\��cc&�U�J���^�!��ÒB�;�?��>tB�M��n�9yD�2���q�q����`;�ji�h��sG�j|�+��c�����m���M�2.��0�9���WY��ڀ�b���P��X.�6i�V�)��sAMf�4��E��3��#zD��QM^�Oqv*ri��X��9"M[�!��>�fN?���͝�B)Ӊ�[ ���8��#|�$��H�7����G2&<��C���c�$���z�}t���+��@t,sbq����ꀑ2�m��/�a�S��I莠�H2 �T��R6��箙L�i��ުXX�����0O]��N�x��mn�DW�&Fi ��ĕ��A3�yQ��`{mr�3؊R,�Į��Ȣ�&;�Ԉ�4\���uGp�}{-�a-"�����b@����_B�[�oUh�؞�|�28�����2���J�����NH���Q
���|}��`m��m��29��ԙ����j���wFd^�_�K,�����2[Tl���l���� ���z;q�>s�����WO��K�ze��ޜ4����a���vn�ǡS��
p�l��I�2��P��;AX�X52`� ]PVPI����r��7b��{�a��eQ�EjҏEp:<)^A�
'Ez1DU���W���n�w�Z�3!�sD02�Q��"]�J�1���.�^���NE����6)��i�TPZ�^���e��l�P�8�H�9�49�Q����ez�^Q�r�c���a�T�{�B�%?�,�	��pv�\��k<�<pK�Q�ş���tkV3�)��9q�a�?N���Mw�2*�6��)��3����o�Y��7 �1�:�I���^8�w���`_[��bE�W��h���6���@�!8��h=����\X���|�����q�������s�f;3j�Y�2�#����!��'u����z��NVet��{s|3!<�cG�)��]:���u����/���i���:��/�dK���.�TyA?�J1�|8�Ӡ�C�t��w��ӄ��E�=7-j��nò���G��d�z��#��"����]
��<�NX�7ܠ��;&�Ur��:�����ZB?,�з#�3�Nt�ab~:    H<�(p���q{���y�N�0����46�vŻt>5uD6�|�@��_��~�/���D; �Ab�۾�+��xM��v5!�!�y�������ɞ��Ոp�J��Ъ!+�B^��±M��m��}�u/9?��:��=��_i�5/�����9`�Px�$ߐD��ky
�8����\A��U��i��h �� f��fa���V�ᶁ��ـ�ZvJ՛���w�術�LbO ^�,�*�S)�0��1��b��׊�mf3p �f�Z����e��;;����8�����=�as���B?%�̲�<Un����5�+���M��G��v�I
xp��uN�Є'\}�9gt���F���&��א/��'Z��<D�����`��z�U���^�״�X��DuH�﬘FFu(�F�R��׏$�f�"��Pa�k�K�e�ol(\h4��9�0��6�A�I���h��w]���CZ*R��e���	��8>�f��PKs3{�?����/o���G��$b�YF��Ь��'N�6�cu�)������L�2�~0���x�$�,�&3 �7�g[�g4#����������g1O�+�/�ˁ��MN�p���ɣ��\�d%���U8�U͔H�$�_�L�Ꙃ�	~�e���ܨI���L�����p�6 ��{W��j��΅��j���^-�"ߏ��u�S]�@���V^�)]u��X�,�H7�v >A|�w	�℉�0��@�>�s��z��aa����5�,Z���mn�Xu,�\�?�R�2ܯ� ��EG�� �rox���Fa�^��4L�V�<�Ǚ1
>]�\)$�-���8\[|���P%f'�C{�9�n��l�V퀜4Ex*�/�3Ôc���I,U9P����T��C�Ǹ$�D!���/���� ʿW؟��b%(k�����j��DN"����IN��6�����+u4(�`�@��V'�dvE�e���*{n<�E�L>rY
����р��.��%[���?X���0����%	��#�R��S~,���yhy������G��^ӑ6�т:Ȕ�|>+Ǿ�{S��8���9�e��w�(���td�	��#8$���Әq���*��^�o$g_%��T�[��`�Yn����q����l����@�F�h�����ݻ��ֵɱ�-�����{�T�4*�g�[`��0�fk?�OZL�ྍitc�8H��`�i�"��V� �<��n�ڹ30��ۍ}=�r���y�K:�>�dꣴ��)��#'ۥ�I�`��zК�4�^�v�2�{�w�R��	I8��*���,[�B�Q�
�lN�-20c�i�Z��z�u v�XkS	�omY�W�r_[f�sTa����3(d3+dڒ~����_7�l̽�>!����>�!���&�y�]�1X�:B�Z�F�,Qh�'cY��cB�����-�݂�Lg��� ^ ��*/�1��:GT�Bk��j����\��^�C�x	�rJ�<��+�9�M���Lǯ3�2}G��[X\��B$n��E �Qib�������42����t��Uf`�5����5ܣ�<6it�/��\ɎYuq��@%�8�CuR�~C�:ZP�o���s�9N�R�>��X��!��ǋB�,󚢋W,���$U߼J�kBaM�ڏ��S�5$���`���bx�c��R{�up�j��¸W� Bb�A1��@g�W�4%p�r�&��ՙsLv�߽��}�l~ᬆ��\7��`��6�G3�N�oTaA��$�"�G��p{aH�����	d�ԫ��*�P�
HW�bcϙ����k�~g�����q.���^h��e�t������}��|j��?rK�#4q(���eGm�Ö�l��;��:A�C�$��c�(e�f��6^�)�a�	$�R��e������!� ���G��v�f�udϞng��ܬ���R�9eH���Mي�D���b_��>t�H#�0�x݀�'iR�r�q�#��~�1릹[�Q|IUˀ�6�ي�w�G{Q��-��C��l0
�Q�9�K�c5��qoy6��~w����@�s�Іbs�����z�7V�����?r��=���1tɄؕ���&v�?Ɖ��L>�TkF�]n/��Fݾa^�����+�ĸ��j��Y�uLT�̏KC�6���|�l]��t5��?���dJ��-ײ���6"��&_�w��|�HK�tM��b��<��-N��-��>�
0����=KS�cz�����z)�Ŧ1���K>���Q�#/����S�L�]��ߠ����{>�V�]4A�1oG��R�ן��9�+�|i�N ����
��z�.�a�g*���k��� ���*���$�e80�-�� �"���^�_�i�@��iÎh���X��R[l9��ч�U�%@k�-�Ko�'���5g=����m?8}rT�f�W�[t^��xC,#�#$b�en'?�<�l+�6Ɏ��ܛ}r�{�˱�%uvN���!j���+Qb6�����K���f,�e77�Ӡ��M����u���޷���7���cAxh���x���e����r,Lh��bo!ڨ󉲍�R��\z`�1$S�����o��]�!Z�%ni��W��]��W�8����t�m~�+F.,�&����@n��;��:�E�0��xz�ś�I��;�I��>:�p}��H�=���A��9Wq���/�H��x�x��ӆ0�?�`��^T+��(�W��V��Qq,�3/��_�700'o�H;��R1��@��W��I� F�<#�X��MӋ�_TD�<�<]�=�˰ ��٥9�14�ɔff�A���e���ٷ�'��G���8�N�oz�8��ś(�z��-�k�(��e��Q�߱Y�vi�S��{J5�ۚH���-�!}3���W��{H]06�����(ڏ�ٕ謪,�i��`n����u4����ꖯ����R-&���x�P};�qS
=qu�S��ո��U?������m��b���-_�����>�*�������.��vC-���*����9�,�}5��}�[��wO��g?�n���(�<2�<0z�<������L>�H��u�Ƀ�9����_Z�r�"���,�Ȩ��+p8Ľ����ӏ/��|�G��<�5�ˤ���씤eKB�R�y��0�4�&b�����n���7xx̒y���	S�0� �]�$-�~�m+&b7D�~`A���Վ�G��HrdRR�;\��s�V'�'���ٗ:��X��#�*�I^�ؤL<�ĺ�������fO�[����l��,�@p�h���Lԧ�j�B�����]������׏�����"V�<�5y�1�7��H<Nʄ�
�<�� �C��6L�g,
��։��j�õ��i��5b?�9�G��떕]��ؚ�נ�}��Ņd���wI)���Z#������mK����ӣ�����G��żپ�k��U�ZWMՠǯk�����b^�ֻ���鍟j0��w����a���Gh ���S�pk���Wŵr��+��F�H�Q�^ɨ��Y?�^��~WA��/|��L�#�4S����Lʠ�����,Dw�^��=�w����{!���m�(�T��N}��N���Z�����Ї��ንF) Y���� ��恨Շ�� �C�F�bE9F��@?>��Q�(v�>�������,#TR�}�2��V�M�\�B�m�X2��=���/��믌������L�I_�[{���o�V�����#1���zu���Z��=���`�A�Ì��	�}��P/�-���A����P�uw�
���j��6WF�|���ȩ4Z
�(3�_�ϯ>�N$�*�	ym����.ŜdNs�C��?_(�D��ʃQإ7E�x��صO"[���R����`���z�p�$��\���~�-F��:~�ZX k�*���|�#0�ە4��j�F��8��q�}��5x�N4RS���V�=�j�=��G�&B�g�f�.�'�B�|�PPOOL!�ϱ��}��k7(h|cR&a� e
�mR��?��
`\�6H�I �  �J�ҿ�����|�U��� -�Eq�"��$3irC��G��`�+U2�N�c4x�a�m��dx���ZJ\{�i9c��7�1� O����P=�,`0$nZi>��	����hG3������pʅ6P���}����Dɓ��yJ\5҃��t��CҖ�$�(��m��A�2ul�I�+q�v'>v	BzȖ�?�Y������s]QEv5�ow1�"�d�M�R?�y�C�iI��i�>�b�?l�6��wPP�:dFó��+QiZ\h�7�i��b�qj3Ftdd�Q�Hs,;PL����u���b���d���-p(U�[5oh����~�ܐ@̕��K��g�O���	�f����/o��=٘�����u��?��X֤��:6������G����Wݗ��4i���U���^�5*���Ic������ѡ�.g{��U��g�3:��йYd�+�U@5c�d�|����خ5���-�ix�K���U�~��~�2��6���%�G�(0���lg'c��͈?����A7�	��" ����:׮�����ܚ�->�#�_���o��pd�T�:
��?-�����#��i��l��v����d���lxߑMK퓞�}fJl�h�b�z q����jX�V@���j���nE���<�f�C���ۊ	��8H�Y)�v��g�`�X�^ٙd
�n��>�Y�?�e\=�YTUW{���F���;	�l�5ڋeh�.��gn� ��;�h��]h���Zt���o�z����^5�Y�#��N�����T��Ac���-^�fÔJ�j�Ha4�W͈"�"�Jy� ��<�?B��E=d�d�y^��~i�7�֧?�:D!����+���Ko�gΠ�='�f ��?���@G1��������h��ذ�RHJ8���!���BR;-�.��SY�d��j_/��G�,�{���0������bf���v��F٤���Ў��뷑�U�a�jƍ��牂��̀�kU
'3�(��i�i}�f��B�����	��+��ݧ����Y���5~�}#�À�����'�%)��.��yvB����A�0!�~T����-���\F���ɯK5a�ޙ�#�b7ar��{��S|����9��{#F�.�S nɖ��3ۻn�`�ƚI���kx�Fc��g�.w�h?K����=�:ڈ=��1]�1��5&���]�r�H�	SɊ��Wh�3Z%c:ޭ��˩侊�/Rb���pL�竃M/�,���f�~��ѯb�-�Q�yr+w��nq��uڿ`�D�ZA�]�7B�b�?�{�hk���^��Y�� 3��%��}����U����FpZ0�`��Gz, ^�#BXq���V|k��1�->��� ��f2�ۿV�_�T��D3�[��y��#�
!���<b���ר�W���X������C7K��a�4SC���w�T4�׆s�I�6��I䉪w5}op)�ݣ��c��p�m�'ü~���s켖�Q�j@ߊ��G1�˪�<�!!��x�{�rh��!ʥ��X\���.�2 S'�����9�s�ri��:��M�`'�W'eh�.�	OW�� ��sͨ`SL-ǻ�tE�i�!��j^�^��d����{����/1�Q��օ�$���K�q*��g������H'kW������1���/v��a�[�Fn<t������H��+�����Uq`xޟ��p�(�y�(r#l��e94'a�}M-��Y�8J���Gۨӎ�y��諲D�L����\b�`��SB�;�m�S߬'#�����4�ϏMH�"B��:0����H�oJ���M|ɬQ�`��_��b�6d6�i��T�4�`U9C���;���{��M�R'pW�d�o�H�R�mK=h��D'���w��ż����<��C��C���|����< 1�>f������`K�0j��m!Dc�/�p���4(r,S{c�n�Ky&���o��<��������N5���(OB���q��z����'����9G�$��َ.�>}r�R�%��p�����>�$�*X��|��S�#$�ըG�-a�uCqnu�*��"��3�{d�6������mz�u�ka�g��/(��0_֪1[��Q�돽� �g�$)��xF�"�.�h��\����p[O�]n��Kq��@�i����V��      N   �  x����j�0 �{�B�� i����ƻ��$M��I\���md��+�	���%�K\,ٖd�cFh�,���&s�ܮ�bC�j_�%�)�e���������m��=g���jR�dM�1��/m�����M��}�v����v�ײ�֭?<l�ݮ𾨫�����§묪��-z�1[�Kt�8`�pa4
"b,��9�bc��f��<bQ�(8n��4(.Ø�d�ġ�
#����м����>��M�NH|�"�(u�9�	�+!�DX0�h�0�x!pr,H�	-⟫dO�Jf8J�G�I�$e�q�)�^����r��:֛N�鋝�!���j&ϳ)(1������:���$4��X����ٷש�z(�v�`*T�gJl0�$�L@�����g��!�ˈ AغyP"�*-�ϓj8Bp�����οk��.�O��_�U�d      P   g  x����K�0����w���ԓQ2�	�z�5�m�&eke�'C<���1ԁ0����!c�G�_��<:/MJ^�ߗF�U?��Ѵ!����u�S�Y�*�1��1 ��w"�YNv��-��P�:r� R�y�J���,e0Ȕ��Q�¹/�m��[�_Lt���L�vـ�ju�������}<xl�GN���o��&�I��%���|^���ý���Cdv�#��q�D�F���9�2A�\p�hΐQ⩝+�(XG��^LpA����:	%(81Nsh����+S�c�eBu�3�`@�:.����?�{�{[�h+BB�~���-YG�k�*�g#\�w�ƼON�� 9r      R   �   x���v
Q���W((M��L�KKMMIJL�V��L�QH��+I�+2�RKR�S���BqIbIi��Bj^Q~NN|f��B��O�k�������zpIi
P��,u�����������!�WRT
4���HӚ˓�n0%�&�q�!7!�`bt �y�      T   �   x�����0�ŻU0������� ���r�F�"�o��v���a�y�///��yy�A��<T=�J).��WBj�0V�@ϵ$��K��3�=V�m�e�+{���8o�Sv�q`F#�z.Tk���N�A�o��v�e����)�֏aى{��^�wӥ7��̺�va�c��TX}���v2��d��.ĲXv����q˦�̷w��<J�?�c;��y�3�(���g�^�3o� � ߓ�      V      x��=ko�V���+.��DY�����H�4I�<�v�Y`��%y%��H����cQ,�EQL�E1�[7(������A����9��K��(��tb��$�>���{7oo]{c�ݼ�}��C�s��'�8�يkW����
�y"�N܁��"�"7L���0���;���8��0��d¯a��@�(o��*�wy��k[lE�5+l�b��~����\�~d1�وY�� '��GOX2�f�����!3ݣ�_|�P��.߻|q-�X���zC�u���_��?����a��;|��[�-^)y��DC��o\�|������5[�/]�y��j�ZjM�֏!T=#L���q/�"��777�Yڊ,ncn� �8�wᡷq�s7�Ɵ�,A�?�g��h\\������3)*$ �bG�	�yt��ݣ���wt�mj1��w�k�68:�s����G�>.6
a�ORE��a4?����}wt�Ђ��e��� �O ���x?�A�s>���;:|�U�=a�\j�g�p��G ����rග�'��<����@�o��/��{�z��x?��g����(THS�)U6�L�c�U�T`$x�_"�a.�Wh�@k"���z@���1����&���#>��6���|x���}��Y��'8���C�*<�a���t@��_�!�3�j e#/��[�2�%���rI��D$��21�5�($�Y��	L���g�����һ���6藦/mܐ�IF�\�#�9ΖK��Q�'��<���>�$G7�h �&X8�VN��p@=�
OґN�r�5T�p�m̘�n��M��^b��n�}��+��m�w��â��u`s'_V/�e)��n^�v�8I��kk=7&�� �}Q�A�<t��vkk&��z�@��]�^�a�AB��5�#���������	|pӪB�e�%��v��`G���0l�j�4n	K3|�آ�u�:7x˪�8?�0�N}C���0rQ��c��M��z��߼|qZ �f[�lmo�R;�?�*,��,"�NVLX�� ��G�|0p?g^��'����:����C��j����@������#r�]
�d&��d��`�|�I�o����죃�3���\+�c���i �����z�� ���i|1d���~�)�L��p2�c�؁7��п^eWP����-I��F^l/� ���A�)Ǯ @B�Sjv���^�m��'_�RP���Qi�<������{ߌ×.�}�D��R�h1�Pu�5�x-N�5�yK,ޥ%?Bወ��Q$�%l��H.-�mz��Y�y�Ғɭ�~}[�/����!�@%^b�Y�7W�ha�Q�;�/-m��5��D�6PĒ,�I	\踈�$	
�[`���
�t��}����-���; ���	@���{��Txm"��zMo��u���i�OZ���%��d���^b{��8��t��K)b�9������X�E�a�Y���!���
)�����Zv[~���@	�V�j��X-�儖�M$��2���h����|�.�!����u�\q�`�_2����W��5��V��w�f˲4��`�k\3떩�:uѱ뭖mga���3>�8��%a��ͭ�a5l��5�����u�EZ��kքմZ����V��[��N���"�Z�akF��Ӻv���L��v8o�mq&��8�p�l�N���Z���V����nOk�Mްz��it��j���Յ�H��k�v��u���Z��l�f�m�	n��j�-�'̍�&D�v3���t��[�s����;C��7��(��{#���z&c%1v�7IF�͂̂a��`��}����~Ch3D�j�cf
�Sߴ��r���6���b����-A��f���s�;�����!V�@C��vg}cň�h, 3����K�������PX@q�j�{��L�x����� S0��Of��+ 
s�@8J-`C�LZH:������(���Fq��`���/l�x&�p��ȍXI%�۪��&��T0	n
��a
;B$1	��%O��@#1�AT q'	B)����㠗��j�y.���bwa�[@� �����C�~�	�ɜ�tu��B�=�� ��/�7I�9�h1bA09z�ژ ���8�\�qb�b���9RT�6���!|(�R~<�6I-����(&U�����0��$ F �RJ8S"U�m�I`\�\W�0� P	�T
� Y�"G_^�� tD$2;A�0/�JʔĒn��>Ҧ
�.T��\�yb��0%��Ex��+y9b(�F���z]x��R|8,Oxd9�D �G}]컼,�B��(�4��*8��2����o�u���te��p�4�x�42t�c��h!cd4�,�&�:y4�R��� �p�0��D9R�W��:��Ҋ���ZcAZ�{ڮ��q����n���B��(s�?g�x��/|�������v��]�n�j��m65So55��4,a�E��8�:F΃��`�<9F�����z�Sw�˰l���܊��v���'[�7܄pdv^��o��羆4)1���|�����m1��K�9o�\XVSk�f]3ڶ�u9�u��k\7ͦ����is��k9&�1}���q��ã�/��q���Y�d���{�̬�2S�[�FK75]t�f�,"3���{����nv[����z�S����y����K_�x5�w4Z]!�����������w��5x�e�	����Ȣ`��^	��ς`Y�)�>n2ΞӢ}[�Ct��S�=�nH�����I��H*�< �֙�B����Xt�*;ɖ?����.~;��Bt	YϜ ����P!������xB�(�!AMR/xo,wQ�1F���T��K4��&��S �f�4��~�4F;0{rt�}
}|t� TA��P�"Ɵ*44�0&���@"�y\�'T���cX�� DYQS�V���'��?ݫ��z���f��:K5��#�<viy�2��2�|�J���1F�F�C�8�dA����C1����x�m��`���H��{崗�g��C�&�V ʃ�,����U����H��1��j�
��@J��@���(�C-��ڴL5@����ejF�
��2���-�֭�ʐ~��z��h��l/9z��V�%tZ]���j�[(��M���9GD1̄%$:�a�ӷ�����y��<yq��8O^�&��@�8n�M�����e����i������p���>���-�^�0����ͺЌn���f��5u�f�Z�k��3���qzz�TIn��<w3�֭�t��4��hkF��k]���t���k��h�	��9"Ң|�T���L3��-{>����r��c�(�砼`_��Qn��<s����_�����ܻ�x��l���������7[�R5���lZFWF�k�n״�i�Z�l���]q&�)g�̙�rQr~��3+��sα?��T���SF�A�L����ֿmJ
���q]���b�[P���x'b��T���KqZY��m/e�q�ף��@p� 4��1�D�	���bR'Zz.�n@�����@�8�����(�c-��2�� ��B�˷�n2|����0��'i�JA���6K&�!���tve�E���0�T�rbM��ҏ�"�ܭk����{�*p���ٿ���-a�-��2�v ��aF#MR��(��1q��}��
�G�L��:e��\��W_��5�0
���`+/��ʗY,"��әb�����"��7�f]��oDl`a_$� ����L���}k���+[[؅na��0��D��Z�<fNH��$/�'��BDYŸ�A���	^^`N�xfC]��<:�ВW$+�����}Y�K���Q�$0���H�Ϙ}+\~�M��M���-��i��"�E� l�5���[�X�`��~�'0ŻC�W/\q�G���+n�, "���[#۪�m�H���o�7�͹�]$ϤH~�Nq�I�y'צ�%�5˅�&@�7�pY�{�ݜ�+��e���T   ��F��h|`��WA�vi�}�W�����fai�׃!�R������ė�V)�7l<1�.��,��,k�nf�f�1_8EiyYa�,��/�;��D�o!ys��J�Ac�k��*����b1a�v\-Pl�A�I�q��9�'ԌxT�{���|�.��2.�>������5\�(r�Z�!�Ȏ6��֡,��]�S��+1�Z0��(��l��T�/J$�be����c��u���JF-�^O]9UNh�~��::|dMS#�O��C�jQ�I�$�}�C��6ߟ*�3���U�
C%���>���T���c�QY��f�ɺ�w�������'
���Cy�DRO�T�M��(��R����,<Ipt�3��	���O�3<
m��E�K��T��.ktB�D�"\_�rKr]�wB���uk��#�)D�{ ��R�E�SW��|	�w �8@c@�����X2-
8�Gb�1�������ȕcgf3S�h8��}Y��RS�n���C	����t^@~�HҮ�֏�Zl��	��H�f�o�3<�� ��!�|�GP�jE=>0m��;'�*��%p�d7Uŵh�SQ�g���1�*�٦�w��β����b�6�����UM� D��x?�e��rvaaU��Ũn;�g�d5E�T4/����V3��'��)�%s�[�e aɽ��l,%S�rX�����S�M�A�1�5�<��Ꮻ���S�X������C�D3����.�4pP#e-U�a����M��NONU�*��X��pRX�E��(̈�	t㯌Z�@gYu��=զK����XǄ�L���B�E����1�mM�X�!S$ơ�g+�h���mX��"��>��]+�H�fQp
͑����Hǰ�e^G�O���J1V�@��t �#}B�G	��ѱ�m~B�N"�2�-?��wjf�H�O@��4�*uEvKΥ
X�.�����^ɪv�V��2Y�Љ�|x�O�B�k&}���e���W���E��hD�l�d�j�$9*٪�w�������<�L�H�R�7ѸBp��4o*B�S �I�F�=&G&�d*�T����-ύ�, dV�2�]u�@Vj�7$�\�Y>�^�V�$~��-Û9�x��i���"�ޅ(Ӷّ��	I�����ghrI��*�5� ʓ�{���|�KUh;�����\b��s�y�%P���qv��l��A�&��L՞^/I&�{�.��7�Z5��/�8���t��Bm�H�TW�C ���j2�9�����E��q}J�����\�^%�V���P�L�^"SO�K�|���t��{���D�/��(wd&�h�bc�)~��kE�� ����jA�mi2&X�p��y"��%����`����+qYg�z��vF�'2V"��SԦrq�*�t���܂��Yy�I���_�)��n�,����n=��V���e���e�5�+��)u��6������b[��^%;%�9�^���:+�9V�|�D��	����������`���	z��Y0�Bt2k������b��/��9҇�<MaU@�ւ�o?��8�9^C_��'��,Ž�/�[<�=���s�Q�d�Ej��~�_�9��<
��Si>yg�/%��..ʳ���0�F��o�0�6�/w���n��/�YB��l��zZ�>�h�%I�R0�V3tf�Ʋܻ�y���C;��7�L�����A'g�|�ʅ�����ey�c��\�d�R̳MH�:&�X�w���!�A�Ai�O"��73�o�v��cƅ����      X   
   x���          Z   �  x���r�F����c�
���sRn"�8
,@��J�� ��u�>328�.�Wέ(����随������jv�k��Ws{?m�m:]�����d}Z-�V�ٝ�iٚ��?�����a��ݶl��}z:$S�5���"I���X�v�Er����rzL��t�/�I���9owJ��8�//�
��&���x{��f��"N]�|n�˾=��Er^�I<_���;^���j=��>�l��`��OX��E2��U깁;�D����,�t#!���	g�@g����)�����p�m㵝|�7�ub�w����d�9pB��`��~�{惮n���;��{���1�G��������D/9�l)����à�>�v�,�^�+_�}}�����#>�#))Ɲ�P�w��H[ ����Ȭ:7����]����C�������9v)L����@�Ā&7�HC!�PD"ռ�#!�&6�a�31)[�1.4�eb�>k��b�5Z�+�`�aJ�9l=bL*ڦAH�ȋ�Y��:�)��0����9����@����a6z��YQU��_�t{�V����1�A�3��z�1L��J$�b�f����@v���Ǒ⒠n�7�9/x5`��8���r;/�4a��6RJƐ�}N��*�o�o��1�N�E�>�F+-"�5�z���������vU���&a\�ʈt�JJ$�mq 駭��ҌN���)�����!���'�T��8d���y�
0L>�)=C�
��.����zի	n����H>����;���	0�y�,"�WSF)1�c��L
��Sf/R���X�U�ՠ�5ZY#�I��[���H�j@���D��F���b��p����j��W���Q��I�5��Q'�`��;��8���ݿ��Y�      \   
   x���          ^      x�՘�n�0��<7'�+�jK蒠����Iր�h��t�JT�x��W��.E�fL��𛔺خ7��҃�C�4���9�'�Ɠ�w��l|y��bS_K36�1A�4�#�s�b��>
0'7lv3��Đ�~FSN�I0��hF��� NH�x���9�E~��OFW�th�Q�'>��"�Z
���F�f	���o�g��U�>+���>p���,?z~p����&�f��G$Ӎ6��uw�^��@�>p�;�^����,���gPm(�6��-a�Ԧtwp#e����m;��)��ޮ����-����n�ח��W�@���5ʘA��6%mȑx�?�]D�����x�Ԗ�K�:T�В!�y���@;R4�]0�6f�*�4�	�YQ���i���US��<�����9�}��N[�� W��Bf��	�J��RJ���0�ZU=�6�ET�z��g��7�N�3�`<�C%ee��N9��Hu�(k	���b)hJ����m5i�h��}t���J�S��/{��M����&��a� �uS����
+���M}x<K�F�B������Ru���IWd,��#E��v���A2��C���͎���3�3Q�mb6|]:\=�R�& �Q�..���q�m�W��kڔ�����}T��6R����UM)/�*�{�)ieW��~rZ[+���mM����O?NI&\,�5�	'iL6x���S�I�g4���A�:wYo�)���Ԙ��t-�vU´�l�{������٫��Z̯Q����ۣqLo1Ĵ0̮��4��MB�e<8�����      `   �  x���1O�@�w~ŷ	I�(B$�5���\K{UW&F�h\ZL&8��q:�������n�]{���w�S�N��ֽ ���=ݥ�"��C	�E�Nh\x����s��Y�T�#CwD]��f���@�,K�W�����GO����ؓ@�I ˊZ��.��]��)|1K|)�/e�/���,�J
�d��$xU�4M|�Y�	&�a�'� �R��� GI�K�w�	l�"̷��������pϣ�m
?3̣�h"�7��7S�j���{pg`��ãǣYXd�1��<���vR�@<|#G�a4�G}!��nA�J�D��XBa� �������<�?��<�����5����Yk)���ƣgCO����[�\��%��~�?)      b   K  x���AK�0��>Żu�L��uk�4u��Lp��� �n�I���/����'�dP�e�[�mB
����r�^�o`���A�>ֲ�xi�;� �k�Vrkž�v܊R�Óp�Vs+Ձ@Í)M��;m�j�>��mkXik��ƨC��TZ�e���b��@J`J�Ѱ�K2��|��]}Jx�?_{��s��e�RLǌ��HF��e4�i`�:� !��Rh���_�W~^�A4�X�Q���X1(�d�;��CXtS���L��%�����=�*U{=�4��`��c6د�h�pK�w�Q�g�"bPэ���ɍ��3
��5z�`�lR      �   
   x���          �   �   x���v
Q���W((M��L�+J�JM.�O�/-*NU��L�QHI,I����(�&���(@�g�h*�9���+hX�(����y��y�
G&>ܽ\!��
)�y�@3SMk.O��nh�l�)���c1�WH~�ky�BIF��]�K������� n�[�      d   *  x�͗Oo�0����VJ� �W-��n��1�!�F��`53��J9���4��E�Tm�L�.��L��&�J��V=$�����<~��00GƩ�zAt6%x?t?d�C�:`�2�2�	Ĝ	#��:\2ĢK�F���;���焋~��	��.�<���uP���\��k�����f������{ZC\�0�Q�9w�[�M/諚�;�kl�������P�L/۵VN�*�֮�kAS-�ne�:��Wj#3��=w~5K�S3��<�^��]f]��x<��
��)���v�*���f&��^G��Gx�&��D�.g�d�7d)#k��0-e���i���GY*�L���*j>DQ�S��nQ��#,1/_Ͻ�'��-���8'��ǿ���j��)�c��_���&����t�.U�JT%7�	A��J�˯ĵ%����ό�-/Aw�j�L�嫼ؐ�|-0��Oc��*��7��m-��B9k�� ��?N�>`yb<�C:B=��_�`���iĘ���7zga_���ۅժ����4      f   U  x��TKn�0��ܨI S�W[E�?`�h~ۀ"��P[$�H�]]����r�{�&��I� ��������������:9�x��y6�M\CS�kh+�=d��C�{�|��W�CSh���n)���6��]��-�zhs�}ռ��]^C�h|Y�1��OAWy�r�_�~�r�33�Z%X����J�M�}�ȋq�=��0��6a$�U"�Q�h {���� <S��:(,U<��k=�;3��~��wP�$|������Xhk�R�:5�(����A.�B)MB�I@A �h��Z����i���W'��i�^��L]F�<qB)� u2N2���ٳ��Dp �b�y� `�2��`j����SC�l��&�z=<�=��-��TrF	U��i�%��gm"X֞���XS��t,	�Q�?�KC�.k�N�׻��F�a��p��ߎB�2q�%ѐ���x4�`��n��8o�-����0d���QGn�I@7+����������U֊xv�x�xB`�D��8�q�:��������'!9���dPX��B�_�h�-��>�q��E�����Zh���n��}�j�dU�T�_��=���	�#��      h   �  x����j1�O���P���]u�B(��V�Na@���>}��0I g#�,�ȹ�\\�7�׭X��/�k�8������Ӱ;6þ=�y{�D����kC%�_��g��ƾ9�������ױ��r�}��O�oˍ��+�?�M%�����WBI�x���:(u����&w8v���w�xg8ff���21#g��q?��8#�Z�dqF�1,3Tiɉ�q#J*e�F�t���(Q� �(��Q�y��-@n7�j4�OEA.7��C�6�j����P�.ΨS�*T�adƸ�F�5S���蔁
%ZG���ԣAq9H��Gف�΍��`f*Ҡ����84ab�s���be� Υ��bU� �!�X�;@��mj�������L��i-Wc�'�vlC��l�6.S��G�M{ip�T���T\\�Wa�R��w�b�Xf�_P�~�      j   �  x�ՖMo�@���{K"����琓�d)J�:�9�����r���/>�9���>��;�z^?~}����м����nʐ�h���xKD��Cv�����X�Mh�Dĵ
Y(>�X7���|W��2;>~|Q[ԡy�w���~�����ζ�f����ӷǵ�%g�����\=�ĕ�Խ�{�)�>E�ͨ$�E4U�(V&��:�j���j�m����r���dK6��f�ڶ�:rGv3nw��SI`[��D*���M3��mi�b3H�qlڡ%���9|�4(?��Qb`����\����j?*i����=�}�FMd��m����N2�%�ӿm�&����}S��N��=85h�VRZ�r�Ns W��ۧʥH��xB�L\�\_ �cL�A�w��D���p3脩6)z��G%�-[�Ü����Wmv"�I�)�*�4*i?vܲ��dn"�:6�*	�y\2`��v����w�-� �p�s      l   z   x���v
Q���W((M��L�+.ILKS��L�QHJ�ˎ�K�M�QHN,J����II-B�+�MJ-�Q k�����K�J�3S4�}B]�4u�B}|PI��ļ���"Cu#Mk... ]�.y      n   �   x��ӻ
�@��ާ�N�%�wRb!qM+�R�	��v�b`ʁ�+��TuS�,T���g��p���8-+�`?�e{��W�cޛ��1���Җ����i���8<z� l���\ֶK���sS�Bn��̹���0���ˆd#$g\�H����1�R�\��P�8Ԝ�6P*DN�D�R4 DR4ߠю6Z��34���=�8��      p   f  x��VAOA��+�MM���Vғ5�R�`�fX`w+��e�ʱ���Ф���CEbLk�mꥻi<���?�a��ziX˾����}���
�;E��yhإ��.4�ҫ��`�(�@�*�U��x�A��T-���Ơnн�e��?%u�6avS~W�{Fy^�fw�0��c0�L$SqE�'ӳx����y�:���B�_Q�=��
���=��=�B�sz`�Nu������%<'-�+)K	��%�D2�F���lv��Lf����Ļl�͑�~��d�#1�窬��������wHW�>2���nD���P��
�b�crb`��t��(S���I�4+A�k�hz���@nx�;
/��h��'��ܑ6��Zs�X�BXG��fFp-�f���)�93"���C�#4)���2|t% =�Aׅ��G�NR�G�4��Ј�<����AN����{��S11"����'����770��PF(4����Aw�y��Ԟj7���wr���?m�>�c<����~����v/�����eR�вx�\S(u_�/ �Tz�ض�;��8p?�VX$�.����D�uA�#L�\����P=����n�pl�-~"^��T=&���Q���ā������Pf��*��	�4�/\Kh�j���9��}D�6�b�F�DH��%��1�:�����(jHF��8��-���+yN��CQFTbƄ���nW�n>c���?��kIG
����{��5
��HM��ڐ�dJ7�[��
�dA��$�s);�6����Ho�0ĺ�e7lTk���
�=�ox4z��۲���w��C�x *Rx`� *J����di��l�����/�˦������h33��L       r   �  x��ֿj�@�ݧ�m*hI.&9�d�P��R�]$�`Bc����Ct�T:thu�����ț4�RL���r\�������]�٪�)Po*70t;���9S�R;�9�[ m��Low�� ��F���u���;v�����C�q_kAN* K8"y�H�����p�h��{=&l����å��̉�D9����"s(���4\
e��*�G(-���)H�$(O{)�Ȋb8�t0w����PJ��q�!��B��B¥K]E�,4�ٿY&�`DKy�BR�H:=�r))�!`�Ȇ)��13|�}
�����DM��lA��Ռ��"	N������Yn������T�����6<F���H���_<k`mp,��*t��V3;o1����*�L��*ŰޖT]��������BK	C�CHF��������E=*�z����^\��/���      s   �   x��ջ
�0��O��B�Ʀ���� ���m�
��o�'G|��-��3�']�Y����+�N�v�W�������7�]
�~޹�ϗ��ƌj_;q�,����7���<��5�ײ��	�Y�+a��<��r}x+ׇz\�q}��x\�q}$���P��×�q}�����G-�G��>���<�'؇�G�G#����P��C=���>���P��C=���>���H���p�G��]�      u   �   x�]��n!��>��d5�ўz����hR�WBaG�0�پ���+�݃i~�'��a�zd��qϺ�~C�} 0\:ۢf3TS��K�$@+�8�����꼻�$n� �{Nh�Eգ�?�t�`��a8���Az�h	�<���/}	�a����h��svZm��6k
��e�,�jQ?�I�ח�ՉM�Z{��mbU����T�gg5�?���q5�,�~�l)      w   �   x��ҽ
�0��ݫ�6BI�Z���@�`���A������o�%�<�[V�[(���mxiuX�^=�=X�U��(��=L�^��6�R�!���F�� ��oJ�O �^��D�����k�%CVbGɍ�#+��0jF�����I���q"�@Đ������n-s��:�q<�.��      y   �  x��Mo�6����--�|��^Z$.��u���5Pe��jK�^�8�C�ŀ��+��⣂~����&�-XYZ��D�!)���S��9lta��݇Q�r�(��0q�4�Bx��n���q�=}64'�9�w<�#�K}�%n�LPFN���&�Zc�I�Yr�,=�6�0��" I��<�s\ߋ��g0��'A��b��8�~˼�>�����Z���ހ�~�}h��P\|t9Ŕ="�&�i��M��DI��mw�����
�����q�>�&F���	ȍ��z2~������ʫ�������Oړ�#}��ߡ�:�p��31o���l,�;G���vg���v���5chu����0� �s5B�Go�m4Y����a�S���&�[�� �l0��
��F�ћ\�ap��C?��s'Â�m���)�D�M&�V���M���,���a?���냟���YWg�[���CH��������MY~~
�� v=��v�`�i�	�5Ӄֳ���)��J��L9mRm�����Z��J�vvZ��H�>8�
�+���H*[{�]�����.�*I�����?^,Gf2��R��Z4Q�� -��Y�7�S�R�T_$f|v���*ܨD[zZ�HM|[�-6�cU�q����&4No
��
ͪ7Z� -�,Emz߄V#`�
0��KŘ�~+��jE�B��ÍW2H���ؕu߄V#`�0R R���Kk�F�Zm�˛��]�6}E�����W܈��Q��6�X1^���u(�>ФZ�f���JnO��@[�cs\nfg$�c��P��-��@u��49�0f��`ck¦��95��Ԧ��u18��p�S��+���
��&�$Ͼ�bC2	�w���{kx��d.9k��)\�3���,����cuaG�����RȒ�{��x]�ъ�H�ڈI�؋^��vb!���O=Lo3      {   |  x�ś�n�6��y
"@�0m�[s)�tZ�h� v���@��f�j$E�8����
�]���&K}�I�x��'<�_ٌg�|��ß�����ɓ#����֭��-wW��=+����M;�ae�8Ӹf�ge������]�|eg�晝�b������ݔy��n�����߿�߼*��u�n�0ׯ���u��>�^b��f����k{���,={�n��v����ǞMGª(�Ċm`��K���Q0�����.�z4�&B������	C0��M'��!��R/'"���� (�QJbf(�
'RO!�c"�0`B�0GSb��n���!D%agD��pq@����*8�x�<s�.�l�˻��u�g{{��ʹ��ھ���y��kStv�-���I�7���W�g�\�ݢ놮u����q��f���ҙ��ӛ�t�x�e˧Eû�<Q�ʢL
�,Nv����E��.�����k0��i�i���O+Uq-��g27<R���Q�㙺~o;T%]<�t��I���-�N�U�����Tq=�
����H�BG2�MU��:�~'Q��m-wkV���f�6�e�K�5�7>���{㸌�_2�<��LE\�H(E*��T�"/y*b�u��E��/�1QŢ2و�-Q҃C^�Ζ���'ʅ�R��$���(�%��{Di�KZ��O�����T���	[��^(0l�q<��〄��	[/P55E�z0l�q<��À:#:)j5SyU�DUc*��Z�@T5�B����(I�(�4�)��sL�$��`z*"�0A��6LQM�+P5���+�
�Vaύj����M���(�����Q-��p�A����`q���)s�o~����U�DUؒ��qt�ٲ��mW�uqq����J։�����_���eɺ�=��aS�E���DA��u*��z�e���:0��?�VVŝ�s�����_¢������������¢�&�:�N������a��uOXo�<��\��8#d�@H�\��NG� d���O��z0<��]~�4��3����{p���Tb��p�l����f�f�S��0�(�rA�^
z|�j#�W�>�>>��H�j��ֳ۟�h��M�D�\R����$�X0`F�NK�r/?l����8 ����j����E�X^��]9�*�dĮ��r8 Q-��ҮD�$���G���ĮH��IT�%��ޕ��(;j���F���<��38`�a;�p
���ۇ6����38`F�BPMDo؄ţ������exԃ�Jzst�Ea@bՄRy$����فM����H��:;�@�M��eБ�xDu�����e�0eg`@��\ �]�4$�      }   8  x��ֿk�@��+ޖ��4���&)���P�R���DG�I��Ғ-S��t��PRH P��t����'=ي���,y����y�t��s[�������IH�M����}�K�(���~DY�2����W�1�l�����mX׷,��⃗bD�D�7��x@�����k�M|��[u��޳�`MG׀xo�y�}�Z�y-:<��`RΜ2e�>��}���}%��s�S�Ln�ę���U�,����w�y��@�(�T��-c"pf�����-���ի����narNu31�r��\9]lD�(ҥ�q5�0�N|�2��Pf�1������W�1�����Z>=�|����T�7>D�)��E��؟%�b��K(k��Yr��+T�Ȭ� R��s1V�,,�X"ӿ����|&�#�;Y�z��,|��N�rճ�M���|S���~'y闪P��/�v#����v��	j��<]��W��܊�L�渶����0���g�8�arz������4�+��%�o�\���b�� �V�l`�v�lb���Y�xw�5� F�=         c  x���Mk1�����T�Kf7�&���X��Гd?��f�[ݥ�_�lmm���&Ȅyxgޙ��%�̖ר�#��ދ�:�P/K0RyQ�
�H���Qy��y�n1:殪Ci_T7٫,飻��v�@=0F��cu���hڵ�.� ��_��$�dX��]a��ҽ�K�zq�7���NRSِ��:��Wr�6yԆ� J�'�R�@���J�\���Y�| tA��JJ��7�2OfS��M�2�B����-�Vҵ�?P`LXU�)�������qKu(�n����*���#x��A�@���e�h.�!P+ZHy��C.�#���}���aH@���m1~}	,n��	�s      �   
   x���          �   
   x���         