Guidance for Claude when working in this repository. This project produces block-based MakeCode Arcade tutorials for young kids, authored as tutorial markdown (README.md per project, loaded via #tutorial: or opened directly in the MakeCode Arcade offline desktop app).

Every tutorial must work for two readers at once: the kid doing the steps, and the educator running the room. Claude should check both before calling a tutorial done.

What this project is
Tutorials teach MakeCode Arcade using blocks, not JavaScript/Python text code. Never write a step that assumes the reader can read code — describe the blocks by name, color/category, and where to find them in the block drawer (e.g. "the Sprites drawer, purple category").
Target audience is younger kids (roughly ages 7–11 unless a specific tutorial says otherwise). Assume inconsistent reading levels, short attention spans, and first-time use of a block editor.
Tutorials are typically run offline, in a classroom, on the MakeCode Arcade desktop app. Don't assume mid-tutorial internet access (no linking out to external videos/pages as a required step — external links are fine as optional extras only).
The primary file format is MakeCode tutorial markdown: numbered ## step headers, blockly-image placeholders, and * * * step separators (MakeCode's convention). Follow the existing structure in any .md file being edited rather than inventing a new format.
The two-lens rule

For every tutorial (new or edited), explicitly check it from both angles before finishing:

As the kid
Can a kid who can't read well yet still make progress, mostly from the block image and short label?
Is each step one action — one block dragged, one field changed, one connection made? Never bundle 2+ new concepts in a single step.
Is there an immediate, visible payoff every 1–3 steps (something moves, changes color, makes a sound)? Kids need frequent proof it's working.
Is the language concrete and physical ("drag," "snap," "click the gear," "make it turn red") rather than abstract programming vocabulary (avoid "instantiate," "parameter," "conditional" — say "if this happens, then...")?
Is there a friendly, encouraging tone? No jargon-flexing, no "obviously," no assuming prior sessions unless this is an explicit sequel tutorial.
As the educator
Can the educator glance at a step and know what "done" looks like for that step, without running the whole tutorial themselves first?
Is there a clear learning objective at the top (what concept this teaches: loops, events, variables, collision, etc.)?
Are there natural checkpoint moments an educator can use to check the whole class is caught up before moving on?
Is timing realistic for a classroom period? Flag roughly how long the tutorial should take if it's more than ~15 minutes.
Are common kid mistakes anticipated with a one-line fix ("If your sprite doesn't move, make sure this block is inside the on start block, not floating loose")?
Does it degrade gracefully if a kid falls behind — can they skip ahead without being completely lost, or does every step hard-depend on the last?

If a step fails either lens, rewrite it before moving on — don't ship a step that only works for one audience.

Authoring rules for steps
One concept per step. If a step needs two sentences to explain what to drag, split it into two steps.
Short, plain sentences. Aim for a step a kid can read in one breath. Avoid semicolons, nested clauses, and passive voice.
Name blocks exactly as they appear in the editor, including capitalization (e.g. on start, set mySprite to), so kids can pattern-match visually.
Show, then say. Reference the block image/placeholder first in the step's structure, keep prose minimal underneath.
Celebrate progress. End tutorials (and ideally mid-tutorial checkpoints) with a "Try it!" or "You made it do X!" moment, not just a block diagram.
No unexplained jumps. If a later step depends on a block from 5 steps ago, briefly remind the reader where it is rather than assuming memory.
Optional stretch goals go at the end, clearly marked (e.g. "### Bonus"), never mixed into the required path — this protects both fast kids (something to do) and slower kids (they aren't behind for skipping it).
Working with existing tutorial files
Before editing, read the full existing file to match its established tone, step numbering, and image/placeholder conventions — don't restart the format from scratch.
Preserve any MakeCode-specific markdown syntax already in use (step separators, template hints, macros) exactly — these are parsed by the editor, not just cosmetic.
When adding new tutorials, mirror the structure of the closest existing tutorial in this repo rather than designing a new template, unless asked to.
Flag (don't silently fix) anything that looks like it depends on an internet connection or an external extension — these break the offline desktop app workflow this project relies on.
Quick self-check before finishing any tutorial edit
 Every step is one action, described in plain, concrete language
 Block names match the editor exactly
 A kid with weak reading skills could follow it from the images/short labels alone
 An educator can see the objective and "done" state for each step at a glance
 No step silently requires internet or an extension
 Bonus/optional content is clearly separated from required steps
 Tone is warm and encouraging, free of jargon