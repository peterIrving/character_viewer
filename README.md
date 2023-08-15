# characters_coding_test

## Running different environments

To run The Wire character viewer, use command:

flutter run --flavor thewire --dart-define=FLAVOR=thewire

To run the Simpsons character viewer, use command: 

flutter run --flavor simpsons --dart-define=FLAVOR=simpsons

### reasoning for the two flavor argument

the `--flavor` argument helps specify on the native layer what the bundle id/package name will be. 

the `--dart-define=Flavor=` argument helps specify which environment file is to be referenced within the flutter codebase

.env.simpsons and .env.thewire files contain the display title of the app as well as the API url. Normally, its not recommended to commit these to source control, but I added them to make testing this sample project easier.

### Note on iOS Bundle IDs

The bundle IDs 'com.sample.simpsonsviewer' and 'com.sample.wireviewer' were not available, so I used 'com.peterIrving.simpsonsviewer' and 'com.peterIrving.wireviewer' instead. 

## Bootstrapped Code

I did not use any code from sample projects, but I did use Chat GPT to generate my API response classes as well as some test code. 
