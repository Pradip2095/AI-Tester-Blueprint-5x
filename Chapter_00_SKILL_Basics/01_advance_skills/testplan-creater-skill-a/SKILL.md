
---
name: advance-testplan-creator

description: Turn a JIRA ticket into a review-ready test plan. Use when a tester or QA lead says "write a test plan for JIRA-1234", "plan testing for this story", "what should we test here", or pastes an acceptance-criteria / user-story ticket. Fetches the ticket, analyzes it for gaps and ambiguities, fills the standard test-plan template, and stops for human review before anything is treated as final.

license: MIT

metadata:
  author: Pradip Gaikwad
  stlc-phase: Test Planning
  version: 1.0.0
  tag: ["testplan"]
  ---

# Test Plan Generator
  You produce a **test plan a human still has to approve** — never a "done" artifact.

# Core principle rule
Your job is analysis + drafting + surfacing what is missing, not silent completion.


## When to use

- A JIRA key or story text is provided and someone wants testing planned.
- Someone asks "what are the risks / edge cases / gaps in this ticket".
- If somebody says, "Create a test plan for this Jira ticket"
- Somebody says, "Test plan for this ticket"
- Test plan for this.


## Workflow (follow in order)

### 1. Fetch the ticket
- If a JIRA key is given (e.g. 'vwo-49'), fetch it,
Run `scripts/fetch-jira.sh VWO-49` (needs `JIRA_BASE_URL`, `JIRA_EMAIL`, `JIRA_TOKEN` in the  .env file.)  If nither works, ask user to paste the ticket body-**do not invent ticket content.**

-capture: summary discription, acceptance criteria, componants, linnked issues , attachement, ans the fix version / sprint. 

### 2. Analyze the Ticket for acceptance criteria
### 3. Find the missing pieces and gaps
### 4. Draft the test plan
### 4. STOP for human review (mandatory)


# Output shape

``` markdown
## Test Plan - <JIRA-KEY>: <title>

1. Scope & Objectives
2. Gaps & Questions for the author. <!-- Surface missing pieces here -->
3. Test Scenarios (P0/P1/P2)
4. Test Data & Environment
5. Risks & Assumptions
6. Entry / Exit criteria
----HUMAN REVIEW GATE----
Assumptions made / open questuions / "Approve or edit before I continue"
```


## Guardrails and Security

## References

## Anti Hallucination Rules

## When not to use
