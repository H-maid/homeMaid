<?php

    public function sendTwilioMessage($to,$message){
        $ch = curl_init();
        $curlConfig = array(
            CURLOPT_URL            => "https://api.twilio.com/2010-04-01/Accounts/AC307807cbfd50e5f2e84f472afb18c413/Messages",
            CURLOPT_POST           => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_USERPWD        => Config::get('app.twilio_credentials'),
            CURLOPT_POSTFIELDS     => array(
                'To' => $to,
                'From' => Config::get('app.twilio_number'),
                'Body' => $message,
            )
        );
        curl_setopt_array($ch, $curlConfig);
        $result = curl_exec($ch);
        curl_close($ch);
    }