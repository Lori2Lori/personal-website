# How to generate html links from text file using regular expression and javascript 

1. Goal, environment and purpose of this program - Explain purpose and method to create in browser interactive window that configures hyperlinks
  - Why I needed this program
  - Why I decided not to use jQuery

2. Description - step by step:

  1. Think about necessary steps to create program
  2. Create simple html document
  2. Inside of this html insert textarea and button
  3. Write script that generates links from given urls
  4. Binding variables (var $)
    - What is binding variable
    - Why it is needed
  5. Prepare utility function - onclick
    1. use 'debugger' to see how the function works
    2. create variables
    3. handle errors
    4. use loop for .. of..
        - split lines in text
        - use regular expression to divide site name and url
        - add list element to html not using jQuery

6. Summary

```
<html>
<head></head>
<body>
  <textarea name="" id="input" cols="30" rows="10"></textarea>
  <button id="generate">Generate</button>
  <div id="output"></div>
  <script type="text/javascript">
    // Script generates links from given urls

    // Prepare utility functions
    // Without binding they won't work
    var $   = document.querySelector.bind(document)
    var $$  = document.querySelectorAll.bind(document)

    $('button#generate').onclick = function (event) {
      debugger
      var input   = $('#input').value
      var output  = $('#output')
      var lines   = input.split('\n')


      var list    = document.createElement('ul')
      var re      = /(\S+)\s(\S+)/

      for (var line of lines) {
        var matches     = line.match(re)

        if (matches === null) {
          continue
        }

        var name        = matches[1]
        var url         = matches[2]
        var item        = document.createElement('li')
        var link        = document.createElement('a')
        link.href       = url
        link.innerHTML  = name

        item.appendChild(link)
        list.appendChild(item)
      }
      output.appendChild(list)
    }
  </script>
</body>
</html>
```
