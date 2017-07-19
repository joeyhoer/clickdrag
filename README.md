# clickdrag

`clickdrag` clicks and drags the pointer from the command line.

## Installation

Download the [`clickdrag` script](https://raw.githubusercontent.com/joeyhoer/clickdrag/master/clickdrag.swift) and make it available in your `PATH`.

    curl -o /usr/local/bin/clickdrag -O https://raw.githubusercontent.com/joeyhoer/clickdrag/master/clickdrag.swift && \
    chmod +x /usr/local/bin/clickdrag

## Example

```bash
# Click at 100,100 drag to 400,400 and release
clickdrag -x 100 -y 100 -dx 400 -dy 400
```
