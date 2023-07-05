import {render, screen} from '@testing-library/react';
import App from '../App';

describe("test", ()=> {
    it('test', ()=> {
        render(<App/>);

        const title = screen.getByRole('heading', {level: 1});
		expect(title).toBeDefined();
    });
})
