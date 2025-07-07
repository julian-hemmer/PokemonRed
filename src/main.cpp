#include <SFML/Graphics.hpp>

int main()
{
    // Create a window with title and size
    sf::RenderWindow window(sf::VideoMode(800, 600), "SFML Window");

    // Main loop
    while (window.isOpen())
    {
        sf::Event event;
        while (window.pollEvent(event))
        {
            // Close window on close event or ESC key press
            if (event.type == sf::Event::Closed ||
               (event.type == sf::Event::KeyPressed && event.key.code == sf::Keyboard::Escape))
            {
                window.close();
            }
        }

        // Clear the window with a color (e.g., blue)
        window.clear(sf::Color(100, 149, 237)); // Cornflower Blue

        // Draw stuff here (e.g., sprites, shapes)

        // Display the contents on screen
        window.display();
    }

    return 0;
}
