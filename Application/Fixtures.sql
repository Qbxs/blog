

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, created_at) VALUES ('6f33d32c-c254-4a69-8fa7-33f67908679b', 'My first post', 'This is it:

```\x y -> x```', '2020-07-31 12:43:03.541486+02');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, post_id, author, body, created_at, email) VALUES ('df634193-50ce-45ae-b8e2-1328e5a367a6', '6f33d32c-c254-4a69-8fa7-33f67908679b', 'Kevin314', 'How do you tame a horse in Minecraft??', '2020-07-31 12:43:48.644951+02', 'kev@gmail.com');
INSERT INTO public.comments (id, post_id, author, body, created_at, email) VALUES ('05f007bc-b99d-42b3-bc57-92cbf85c5b2e', '6f33d32c-c254-4a69-8fa7-33f67908679b', 'Bilbo', 'Precious!!', '2020-11-06 10:28:25.514134+01', '');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts) VALUES ('43241cf4-ec8a-4155-a315-8a169b671264', 'ip4ssi@gmail.com', 'sha256|17|aXPl/xbJJmdOxaNkDtgNbg==|aNCPDDnjGOZniAmWr7s3oFxX2P8l3+w5TD1dKSN1MnQ=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


