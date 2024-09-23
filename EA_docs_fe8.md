# Event Assembler Documentation for FE8

## Basic Language Abilities

### Comments:
- `/**/`: Ignores everything between the `**`.
  - Example:  
    ```MNCH /*Comment*/ 0x55```  
    will be treated as:  
    ```MNCH 0x55```
  
- `//`: Ignores the rest of the line.
  - Example:  
    ```MNCH 0x55 // inline comment```
    will be treated as:  
    ```MNCH 0x55```

### Using Labels:
- If the first word of a line ends with `:`, it is considered a label.
  - Example:  
    ```randomName:```  
    Can be referenced with:  
    ```POIN randomName```

### Number Formats:
- Hex numbers start with `0x` or `$`.
- Binary numbers end with `b` or `B`.
- Decimal numbers are interpreted by default.

### Multiple Codes on One Line:
- Use `;` to separate multiple codes on one line.
  - Example:  
    ```CODE1; CODE2```

### Arithmetic Operations:
- Supported: `+`, `-`, `*`, `/`, `%`, `&`, `|`, `^`, `<<`, `>>`.
- Dividing by zero causes errors.

### Preprocessor:
- Use `#define` to define text to mean something else.
  - Example:  
    ```#define Eliwood 1```  
    Allows usage in code like:  
    ```IFCA 15 Eliwood```
  
- Use `#undef` to remove a definition.

- Check definitions with `#ifdef` and `#ifndef`.

### Including Files:
- `#include "filePath"`: Includes code and variable definitions from other files.

### Macros:
- Macros allow parameterized defines.
  - Example:  
    ```#define Sieze(eventID,offset,X,Y) "LOCA eventID offset [X,Y] 0xF"```  
    Can be used like:  
    ```Sieze(0x20,Sieze_Your_Mom,2,33)```  
    Which translates to:  
    ```LOCA 0x20 Sieze_Your_Mom [2,33] 0x0F```

---

## Special Codes

### ORG Offset
Changes the current offset of the assembly.

### CURRENTOFFSET
Returns the current offset.

### MESSAGE
Displays a message in Event Assembler.

### ERROR
Displays an error message in Event Assembler.

### WARNING
Displays a warning message in Event Assembler.

### ALIGN Value
Aligns the current offset to a value (commonly divisible by 4).

---

## Conditional Commands

### GOTO ConditionalID
Unconditionally jumps to `LABEL ConditionalID`.

### LABEL ConditionalID
Defines a label to be jumped to.

### CHECK_MODE
Stores the current mode in memory slot `0xC`.

### BEQ ConditionalID, Slot1, Slot2
Branches to `LABEL ConditionalID` if `Slot1 == Slot2`.

### BNE ConditionalID, Slot1, Slot2
Branches if `Slot1 != Slot2`.

### BGE ConditionalID, Slot1, Slot2
Branches if `Slot1 >= Slot2`.

### BGT ConditionalID, Slot1, Slot2
Branches if `Slot1 > Slot2`.

### BLE ConditionalID, Slot1, Slot2
Branches if `Slot1 <= Slot2`.

### BLT ConditionalID, Slot1, Slot2
Branches if `Slot1 < Slot2`.

---

## Text and Dialogue

### FADI FadeTime
Fades in to dark. Higher `FadeTime` means slower fading.

### FADU FadeTime
Fades out of dark.

### REMA
Removes text bubbles, backgrounds, and portraits, returning to the map.

### TEXTSHOW TextID
Shows the text for `TextID`.

### TEXTEND
Ends the text sequence.

---

## Camera

### CAM1 [X, Y]
Moves the camera to the specified coordinates.

### CAM1 Character
Moves the camera to the specified character.

---

## End of Event

### ENDA
Ends an event.

---

## Event ID Manipulation

### ENUT EventID
Marks an event ID as used.

### ENUF EventID
Marks an event ID as unused.

---

## Location-Based Events

### LOCA ID [X, Y] Command
Triggers a location-based event when a unit is placed on the specified position and selects the corresponding command.

### VILL ID *EventPointer* [X, Y] Command
Triggers a village event when a unit visits a village.

### SHOP ID *ShopListPointer* [X, Y] Command
Triggers a shop event when a unit visits a shop.

### CHES ID *ChestData* [X, Y] Command
Triggers a chest event to give items or money.

---

## Turn-Based Events

### TURN ID *EventPointer* [StartTurn, EndTurn] TurnMoment
Triggers an event at specific parts of one or several turns.

---

## Unit Manipulation

### SPAWN_ALLY Char [X, Y]
Spawns an ally unit at the specified coordinates.

### MOVE Speed Character [X, Y]
Moves a character to a new position with the specified speed.

### PROM Character Class Item
Promotes a unit to a new class using the specified item.

### DISA Character
Removes a character from the map.

---

## Screen Effects

### STARTFADE
Starts a fade effect.

### FADECOLORS Target Speed Red Green Blue
Fades the screen using specified color values.

---

## Miscellaneous

### STAL Time
Pauses event execution for the specified time.

### RANDOMNUMBER MaxValue
Generates a random number between 0 and `MaxValue`.

---

## Music and Sound

### MUSC MusicID
Changes the background music to `MusicID`.

### MUSI
Reduces music volume.

### MUNO
Restores normal music volume after using `MUSI`.

---

## Memory Manipulation

### SVAL Slot Value
Stores a value in the specified memory slot.

---

## Moving to a Chapter

### MNCH ChapterID
Moves to a chapter through the save dialog.

### MNC2 ChapterID
Moves to a chapter directly.

---

## Map Manipulation

### LOMA ChapterID
Loads a new map mid-event using the specified chapter's ID.

---

## Weather and Fog

### VCWF VisionDistance
Changes the vision distance on the map.

### WEA1 WeatherTypeID
Changes the weather to the specified type.

---

## Fighting

### FIG1 Attacker Defender
Starts a fight between two units.

---

## Display Movement Range

### SHOW_ATTACK_RANGE Char
Displays the movement range for the specified character.

---

## Traps

### BLST [X, Y] Type
Sets a ballista trap at the specified coordinates.

### FIRE [X, Y] Type [SizeX, SizeY]
Sets a fire trap at the specified coordinates and size.

---

## Unit Data

### UNIT CharID ClassID LeaderChar [X, Y] Flags Byte1 DataCount REDA *Items* *AI*
Defines the data for units to be loaded onto the chapter map.

### ENUN
Waits until unit loading, movement, and other unit events are completed.

---

## World Map

### WM_SETCAM X Y
Sets the world map camera to the specified coordinates.

### WM_PUTSPRITE ID Class Allegiance X Y
Places a sprite on the world map.