+++
title = "Paytm Insider: interactive live video at scale"
description = "How nilenso helped Insider take live events online, streaming interactive video towards a million concurrent users, piloted with a live quiz."
weight = 7

[extra]
name = "Paytm Insider"
blurb = "Interactive live video for India's largest ticketing platform."
logo = "paytm-insider.png"
talks = [
    {venue = "Functional Conf", title = "After the Crash", link = "https://www.youtube.com/watch?v=9nbPZOHBsK4"},
    {venue = "RootConf", title = "Scalable distributed systems in Elixir", link = "https://www.youtube.com/watch?v=yMJ2u6J3Cb0"}
]
+++

<p class="text-black text-base leading-normal md:text-xl lg:text-2xl xl:text-2xl font-normal pb-10 w-full max-w-[46rem] w-full company-blurb">
PayTM Insider is India's largest online ticketing and events company. Insider approached nilenso with a pioneering concept for its time: to take their live, interactive events online.
</p>

<div class="border-t border-b border-gray-200 py-10">
<p class="text-pink-500 text-base leading-normal md:text-xl lg:text-xl md:leading-snug font-light">
We worked with Insider to build a digital platform for live events, with the objective of “streaming interactive video to one million concurrent users”.
</p>
</div>

<div class="md:pt-0 md:pb-0 py-10">
<p class="md:pt-12 text-black text-base leading-normal md:text-xl lg:text-xl md:leading-snug font-light tpb-4 md:pb-7">
The pilot was a real-time quiz that thousands of users would participate in. In addition to all the challenges that come with live video, we had to ensure that all participants received the questions at the same time.
</p>

<p class="text-black text-base leading-normal md:text-xl lg:text-xl md:leading-snug font-light pb-4 md:pb-7">
Our solution involved a dashboard from where a producer could run the quiz, publish questions and answers to a massive live audience, and coordinate transitions from one question to the next.
</p>

<p class="text-black text-base leading-normal md:text-xl lg:text-xl md:leading-snug font-light pb-4 md:pb-7">
We also built video transcoding into the platform using mimoLive and Wowza Cloud, so the live video stream from the quizmaster could be streamed to all participants.
</p>

<p class="text-black text-base leading-normal md:text-xl lg:text-xl md:leading-snug font-light pb-4 md:pb-7">
The quiz and video were synchronized by stamping metadata onto the stream, self-identifying sync time, and compensating for server-side transcoding delays on mobile clients.
</p>

<p class="text-black text-base leading-normal md:text-xl lg:text-xl md:leading-snug font-light pb-4 md:pb-7">
In order to load test the system, we built a Mob Simulator, that simulated hundreds of thousands of concurrent users.
</p>

<p class="text-black text-base leading-normal md:text-xl lg:text-xl md:leading-snug font-light">
The service was transitioned to an in-house team over months, while coaching them on Elixir, and OTP as well.
</p>
</div>
