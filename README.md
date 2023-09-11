# NewsPosts

## Posts Viewer App

This is a simple iOS app that allows you to download data in JSON format from a server, process it, and display it on the screen. The app has two main functions:

### 1. Viewing a List of Posts (Feed Screen): Users can browse a list of posts with the following features:
   
 -Sorting the feed by date in descending order (local sorting).
 
 -Sorting the feed by rating in descending order (local sorting).
 
 -Displaying a brief description of each post in a table view cell. The cell height is dynamic. If the text occupies less than 2 lines or exactly 2 lines, the full text is displayed without height constraints. If the text spans more than two lines, an ellipsis (...) is added at the end of the second line, and the text is truncated. A "Read More" button is provided to expand the cell, removing the height constraint and displaying the full post text. A "Collapse" button is also available to revert to the collapsed state. The app remembers the expanded state of cells to prevent loss of state during scrolling.
 
 -Tapping on a specific post opens the post details screen.

### 2. Viewing Post Details (Detail Screen): Users can view detailed information about a selected post, including an image and additional details.


## Feed Screen Features:

### Sorting
 
### Users can sort the feed in two ways:

 -Sort by Date: This option sorts the feed by the date of the posts in descending order (newest to oldest).

 -Sort by Rating: This option sorts the feed by the rating of the posts in descending order (highest rating to lowest).


## Cell Display

### Each feed cell displays the following:

 -Title: The title of the post.
 
 -Preview Text: A brief description of the post. The text can be expanded by tapping the "Read More" button.
 
 -Likes Count: The number of likes for the post.
 
 -Date: The date of the post in the "dd/MM/yyyy" format.


## Dynamic Text Display

 -The app automatically adjusts the cell height based on the content. If the text fits within 2 lines or exactly 2 lines, it is displayed in full without height constraints.
 
 -If the text spans more than two lines, it is truncated with an ellipsis (...) at the end of the second line, and a "Read More" button is provided to expand the cell.
 
 -Users can expand and collapse text content in cells as needed without losing state during scrolling.


## Detail Screen Features:

### Post Details

 -The detail screen displays the selected post's title, full text, likes count, date, and an associated image.


### Usage

To use the app:

### 1. Launch the app on your iOS device.
 
### 2. On the feed screen, you can:

 -Sort posts by date or rating using the sorting options.
 
 -Tap on a post to view its details.
 
 -Expand or collapse text content in cells by tapping the "Read More" or "Collapse" button.
 
### 3. On the detail screen, you can:
   
 -View detailed information about the selected post, including the full text and an image.


## Note

This app uses local sorting and handles dynamic text display with expand/collapse functionality for improved user experience.

Enjoy browsing and exploring the posts!


Author: Solovei Ihor

Date: September 2023


<img width="520" alt="Screenshot 2023-09-11 at 4 49 16 PM" src="https://github.com/Halsdraiher/NewsPosts/assets/112000609/a7c6f25c-49cb-4740-832b-a8a725f29d1c">
<img width="520" alt="Screenshot 2023-09-11 at 4 49 20 PM" src="https://github.com/Halsdraiher/NewsPosts/assets/112000609/534ce613-c532-4ffe-8bf6-a45f96013c67">
<img width="520" alt="Screenshot 2023-09-11 at 4 49 45 PM" src="https://github.com/Halsdraiher/NewsPosts/assets/112000609/2b09a79a-6715-4de3-a7f9-69fae315ad6f">
<img width="520" alt="Screenshot 2023-09-11 at 4 49 58 PM" src="https://github.com/Halsdraiher/NewsPosts/assets/112000609/3002f046-2afb-42d2-9a19-aa7c13e801fe">

