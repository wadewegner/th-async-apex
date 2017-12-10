# Instructions

Here's how to use this SFDX project with Trailhead.

```
mkdir mdapiout

sfdx force:source:convert -d mdapiout

sfdx force:mdapi:deploy --wait 100 -d mdapiout -u <your TPO>

sfdx force:text:run -r human -u <your TPO>
```

Then click the button to validate on Trailhead.