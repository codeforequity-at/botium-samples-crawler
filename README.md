# Botium Crawler - Like a Website Crawler for Conversation Flows

This is a sample for showing functionality of the [Botium Crawler](https://github.com/codeforequity-at/botium-crawler).

## Requirements

In order to run this sample, you need:
* An [IBM Cloud account](https://cloud.ibm.com/registration) with a [Watson Assistant service](https://cloud.ibm.com/docs/assistant?topic=assistant-getting-started)
* [Docker](https://docs.docker.com/get-docker/)
* make (or copy & run the command from the _Makefile_ in a shell window)

## Prepare Watson Assistant

This sample is using a Watson Assistant workspace from [this](https://github.com/watson-developer-cloud/assistant-intermediate) Github repository. Download the sample workspace from the _<project_root>/training/banking_workspace.json_ file.

* In Watson Assistant, create a dialog skill and import it from the above file
* Create an Assistant and choose this dialog skill
* Open the _Settings_ menu and click on _API details_ to get the **Assistant ID** and the **API key**

## Prepare botium.json

Enter the **Assistant ID** (capability _WATSON\_ASSISTANT\_ID_) and the **API key** (capability _WATSON\_APIKEY_) in the file _botium.json_ in this repository.

## Run Crawler

Before running the Botium Crawler, let's check the connectivity to your Watson Assistant. First, download the Botium CLI Docker image:

    $ make pull

This will take some minutes. Afterwards, run this command to enter a text-based chat interface with your Watson Assistant:

    $ make chat

If the chat is showing the welcome message from the Watson Assistant, we are fine. Enter _#EXIT_ to cancel the chat.

Now everything is prepared for launching the crawler. Run this command:

    $ make crawl

The crawler now follows every detected path in the conversation flow of your Watson Assistant, starting from the welcome message. It will follow all detected quick replies and options list and choose every possible option. After a while the crawler will come to an end and will ask you if you want to continue on a conversation path for which the Watson Assistant doesn't present quick replies or option lists.

For example, at some point the chatbot may ask for an appointment:

    "Which date would be best for you? We need 24 hours notice for an appointment, the earliest would be tomorrow."

Here you can enter all the options you want to send to the chatbot as possible response:

    "tomorrow"
    "next monday"
    "in two weeks"

Botium Crawler will then continue crawling based on your responses. It will remember your selection in the _crawler-result/userFeedback.json_ file for the next run.

The BotiumScript files are saved in the _crawler-result/scripts_ directory.

## Run Tests

Now it is time to do a first test run - the following command will run all of the detected conversation flows again:

    $ make test
    Botium Test-Suite
      ✓ 1.1.1_WELCOME_MESSAGE_Making a credit _FAILED (490ms)
      ✓ 1.1.2_WELCOME_MESSAGE_Making a credit _FAILED (1017ms)
      ✓ 1.1.3_WELCOME_MESSAGE_Making a credit _FAILED (442ms)
      ✓ 1.2_WELCOME_MESSAGE_Choosing a credi (181ms)
      ✓ 1.3.1_WELCOME_MESSAGE_Booking an appoi (436ms)
      ✓ 1.3.2_WELCOME_MESSAGE_Booking an appoi (407ms)
      ✓ 1.3.3.1_WELCOME_MESSAGE_Booking an appoi (548ms)

    7 passing (7s)

**Congratulations, you just finished your first Botium Crawler run!**

## Edit Feedback and Re-Run Crawler

If later you see that you want to add additional options to the ones you already gave above:

    $ make feedback

This will present all selected options for adding, removing or changing. After changing something there, you have to re-run the crawler to detected additional conversation flows.


